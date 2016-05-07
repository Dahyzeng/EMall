package emall.dao.profile.user;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by taurin on 2016/4/29.
 */
@Repository
public class OrderDao {
    @Autowired
    SessionFactory sessionFactory;

    public List getUserOrder(String userId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Order where userId=?");
        query.setString(0, userId);
        return query.list();
    }
}
