package emall.dao.category;

import emall.entity.Category;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by taurinzeng on 2015/12/21.
 */
@Repository
public class CategoryDao {
    @Autowired
    private SessionFactory sessionFactory;

    /**
     * function
     * add item category
     * @param category item category
     */
    public void addCategory(Category category) {
        sessionFactory.getCurrentSession().save(category);
    }

    /**
     * function
     * check whether current category has child category
     * @param categoryId current category id
     * @return
     * 0 for none
     * other for have child category
     */
    public int findChildCategory(int categoryId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Category where fatherId=?");
        query.setInteger(0, categoryId);
        List list = query.list();
        return list.size();
    }

    public int findItem(int categoryId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Item where categoryId=?");
        query.setInteger(0, categoryId);
        return query.list().size();
    }

    public Object getCategoryName(int categoryId) {
        Query query = sessionFactory.getCurrentSession().createQuery("select categoryName from Category where categoryId=?");
        query.setInteger(0, categoryId);
        return query.list().get(0);
    }

    public int matchCategoryName(String categoryName, int fatherId) {
        String sql = "from Category where categoryName=? and fatherId=?";
        if (fatherId == 0) {
            sql = "from Category where categoryName=? and fatherId='0'";
        }
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setString(0, categoryName);
        if (fatherId != 0) {
            query.setInteger(1, fatherId);
        }
        return query.list().size();
    }

    public List getAllFatherCategory() {
        Query query = sessionFactory.getCurrentSession().createQuery("from Category where fatherId='0'");
        return query.list();
    }

    public List getChildCategory(int fatherCategoryId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Category where fatherId=?");
        query.setInteger(0, fatherCategoryId);
        return query.list();
    }
    /**
     * function
     * delete current category
     * @param categoryId current category id
     */
    public void deleteCategory(int categoryId) {
        Query query = sessionFactory.getCurrentSession().createQuery("delete from Category where categoryId=?");
        query.setInteger(0, categoryId);
        query.executeUpdate();
    }

    public void modifyCategory(Category category) {
        Query query = sessionFactory.getCurrentSession().createQuery("update Category set categoryName=? where categoryId=?");
        query.setString(0, category.getCategoryName());
        query.setInteger(1, category.getCategoryId());
        query.executeUpdate();
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
