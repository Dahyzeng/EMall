package emall.dao.item;

import emall.entity.Item;
import emall.entity.PromotionItem;
import emall.util.string.constants.MerchantConstants;
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

    public void deleteItem(String itemId) {
        Query query = sessionFactory.getCurrentSession().createQuery("delete Item where itemId=? and status=0");
        query.setString(0, itemId);
        query.executeUpdate();
    }

    public void updateItemDiscount(Item item) {
        Query query = sessionFactory.getCurrentSession().createQuery("update Item set discount=? where itemId=?");
        query.setFloat(0, item.getDiscount());
        query.setString(1, item.getItemId());
        query.executeUpdate();
    }

    public void updateItem(Item item) {
        String sql = "update Item set itemName=?, categoryId=?, price=?, inventory=?, description=? ";
        int flag = 0;
        if (item.getShowPicURL() != null) {
            sql += ", showPicURL=? ";
            flag = 1;
        }
        sql += "where itemId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setString(0, item.getItemName());
        query.setString(1, item.getCategoryId());
        query.setFloat(2, item.getPrice());
        query.setInteger(3, item.getInventory());
        query.setString(4, item.getDescription());
        if (flag == 1) {
            query.setString(5, item.getShowPicURL());
            query.setString(6, item.getItemId());
        } else {
            query.setString(5, item.getItemId());
        }
        query.executeUpdate();
    }

    public void changeStatus(String itemId, int status) {
        Query query = sessionFactory.getCurrentSession().createQuery("update Item set status=? where itemId=?");
        query.setInteger(0, status);
        query.setString(1, itemId);
        query.executeUpdate();
    }

    public List getItemsByCategoryId(Object categoryId, int page, int status) {
        String sql = "from Item";
        int flag = 0;
        if (categoryId != null) {
            if (categoryId.getClass() == String.class) {
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
            query.setString(0, categoryId.toString());
        }
        query.setFirstResult((page - 1) * MerchantConstants.PAGE_SIZE);
        query.setMaxResults(MerchantConstants.PAGE_SIZE);
        return query.list();
    }

    public List getItemsByCategoryIdStore(Object categoryId, int page, int status, int pageSize) {
        String sql = "from Item";
        int flag = 0;
        if (categoryId != null) {
            if (categoryId.getClass() == String.class) {
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
            query.setString(0, categoryId.toString());
        }
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);
        return query.list();
    }

    public List getItemById(String itemId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Item where itemId=?");
        query.setString(0, itemId);
        return query.list();
    }

    public Object getItemNameById(String itemId) {
        Query query = sessionFactory.getCurrentSession().createQuery("select itemName from Item where itemId=?");
        query.setString(0, itemId);
        return query.list().get(0);
    }

    public void updateDiscount(PromotionItem promotionItem) {
        sessionFactory.getCurrentSession().saveOrUpdate(promotionItem);
    }

    public List getDiscount(String itemId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from PromotionItem where itemId=?");
        query.setString(0, itemId);
        return query.list();
    }
}
