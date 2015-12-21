package emall.dao.category;

import emall.entity.Category;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by taurinzeng on 2015/12/21.
 */
@Repository
public class CategoryDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void addCategory(Category category) {
        sessionFactory.getCurrentSession().save(category);
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
