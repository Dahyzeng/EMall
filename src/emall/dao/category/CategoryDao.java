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
    public int findChildCategory(String categoryId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Category where fatherId=?");
        query.setString(0, categoryId);
        List list = query.list();
        return list.size();
    }

    public int findItem(String categoryId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Item where categoryId=?");
        query.setString(0, categoryId);
        return query.list().size();
    }

    public Object getCategoryName(String categoryId) {
        Query query = sessionFactory.getCurrentSession().createQuery("select categoryName from Category where categoryId=?");
        query.setString(0, categoryId);
        return query.list().get(0);
    }

    public int matchCategoryName(String categoryName, String fatherId) {
        String sql = "from Category where categoryName=? and fatherId=?";
        if (fatherId == null) {
            sql = "from Category where categoryName=? and fatherId IS NULL";
        }
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setString(0, categoryName);
        if (fatherId != null) {
            query.setString(1, fatherId);
        }
        return query.list().size();
    }

    public List getAllFatherCategory() {
        Query query = sessionFactory.getCurrentSession().createQuery("from Category where fatherId IS NULL");
        return query.list();
    }

    public List getChildCategory(String fatherCategoryId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Category where fatherId=?");
        query.setString(0, fatherCategoryId);
        return query.list();
    }
    /**
     * function
     * delete current category
     * @param categoryId current category id
     */
    public void deleteCategory(String categoryId) {
        Query query = sessionFactory.getCurrentSession().createQuery("delete from Category where categoryId=?");
        query.setString(0, categoryId);
        query.executeUpdate();
    }

    public void modifyCategory(Category category) {
        Query query = sessionFactory.getCurrentSession().createQuery("update Category set categoryName=? where categoryId=?");
        query.setString(0, category.getCategoryName());
        query.setString(1, category.getCategoryId());
        query.executeUpdate();
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
