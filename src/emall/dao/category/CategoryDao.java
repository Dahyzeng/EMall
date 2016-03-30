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
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
