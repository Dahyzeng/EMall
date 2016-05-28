package emall.dao.item;

import emall.entity.Item;
import emall.entity.PromotionItem;
import emall.util.string.constants.MerchantConstants;
import emall.util.string.constants.PageSizeConstant;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taurin on 2016/4/12.
 */
@Repository
public class ItemBaseDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void addItem(Item item) {
        sessionFactory.getCurrentSession().persist(item);
    }

    public void deleteItem(int itemId) {
        Query query = sessionFactory.getCurrentSession().createQuery("delete Item where itemId=? and status=0");
        query.setInteger(0, itemId);
        query.executeUpdate();
    }

    public void updateItemDiscount(Item item) {
        Query query = sessionFactory.getCurrentSession().createQuery("update Item set discount=? where itemId=?");
        query.setFloat(0, item.getDiscount());
        query.setInteger(1, item.getItemId());
        query.executeUpdate();
    }

    public void updateItem(Item item) {
        String sql = "update Item set itemName=?, categoryId=?, price=?, inventory=?, description=?, discount=? ";
        int flag = 0;
        if (item.getShowPicURL() != null) {
            sql += ", showPicURL=? ";
            flag = 1;
        }
        sql += "where itemId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setString(0, item.getItemName());
        query.setInteger(1, item.getCategoryId());
        query.setFloat(2, item.getPrice());
        query.setInteger(3, item.getInventory());
        query.setString(4, item.getDescription());
        query.setFloat(5, item.getDiscount());
        if (flag == 1) {
            query.setString(6, item.getShowPicURL());
            query.setInteger(7, item.getItemId());
        } else {
            query.setInteger(6, item.getItemId());
        }
        query.executeUpdate();
    }

    public void changeStatus(int itemId, int status) {
        Query query = sessionFactory.getCurrentSession().createQuery("update Item set status=? where itemId=?");
        query.setInteger(0, status);
        query.setInteger(1, itemId);
        query.executeUpdate();
    }

    public List getItemsByCategoryId(Object categoryId, int page, int status, int pageSize) {
        String sql = "from Item";
        int flag = 0;
        if (categoryId != null) {
            if (categoryId.getClass() == Integer.class) {
                sql += " where categoryId=?";
                flag = 1;
            } else if (categoryId.getClass() == StringBuilder.class) {
                String tmp = categoryId.toString();
                String categoryIds = tmp.substring(0, tmp.length() - 1);
                sql += " where categoryId in (" + categoryIds + ")";
                flag = 3;
            }
        }
        if (flag != 0) {
            sql += " and status=" + status;
        } else {
            sql += " where status=" + status;
        }
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        if (flag == 1) {
            query.setInteger(0, (Integer) categoryId);
        }
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);
        return query.list();
    }

    public List getItemsByCategoryIdStore(Object categoryId, int page, int status, int pageSize, String sorValue) {
        String sql = "from Item";
        int flag = 0;
        if (categoryId != null) {
            if (categoryId.getClass() == Integer.class) {
                sql += " where categoryId=?";
                flag = 1;
            } else if (categoryId.getClass() == StringBuilder.class) {
                String tmp = categoryId.toString();
                String categoryIds = tmp.substring(0, tmp.length() - 1);
                sql += " where categoryId in (" + categoryIds + ")";
                flag = 3;
            }
        }
        if (flag != 0) {
            sql += " and status=" + status;
        } else {
            sql += " where status=" + status;
        }
        if (sorValue != null) {
            if (sorValue.equals("saleDown")) {
                sql += " order by saleQuantity DESC";
            } else if (sorValue.equals("saleUp")) {
                sql += " order by saleQuantity ASC";
            } else if (sorValue.equals("priceUp")) {
                sql += " order by price ASC";
            } else {
                sql += " order by price DESC";
            }
        }
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        if (flag == 1) {
            query.setInteger(0, (Integer) categoryId);
        }
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);
        return query.list();
    }

    public List getItemById(int itemId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Item where itemId=?");
        query.setInteger(0, itemId);
        return query.list();
    }

    public Object getItemNameById(int itemId) {
        Query query = sessionFactory.getCurrentSession().createQuery("select itemName from Item where itemId=?");
        query.setInteger(0, itemId);
        return query.list().get(0);
    }

    public void updateDiscount(PromotionItem promotionItem) {
        sessionFactory.getCurrentSession().saveOrUpdate(promotionItem);
    }

    public List getDiscount(int itemId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from PromotionItem where itemId=?");
        query.setInteger(0, itemId);
        return query.list();
    }

    public List getItemInventory(int itemId) {
        Query query = sessionFactory.getCurrentSession().createQuery("select inventory from Item where itemId=?");
        query.setInteger(0, itemId);
        return query.list();
    }

    public void updateItemInventory(int itemId, int count) {
        Query updateQuery = sessionFactory.getCurrentSession().createQuery("update Item set inventory=inventory + ? where itemId=?");
        updateQuery.setInteger(0, count);
        updateQuery.setInteger(1, itemId);
        updateQuery.executeUpdate();
    }

    public void updateSaleQuantity(int itemId, int count) {
        Query query = sessionFactory.getCurrentSession().createQuery("update Item set saleQuantity=saleQuantity + ? where itemId=?");
        query.setInteger(0, count);
        query.setInteger(1, itemId);
        query.executeUpdate();
    }

    public List getItemByName(String name, int page, int pageSize, String orderBy) {
        String sql = "from Item where itemName like ? and status = 1";
        if (orderBy != null) {
            if (orderBy.equals("saleDown")) {
                sql += " order by saleQuantity DESC";
            } else if (orderBy.equals("saleUp")) {
                sql += " order by saleQuantity ASC";
            } else if (orderBy.equals("priceUp")) {
                sql += " order by price ASC";
            } else {
                sql += " order by price DESC";
            }
        }
        System.out.print(sql);
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setString(0, "%" + name + "%");
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);
        return query.list();
    }
}
