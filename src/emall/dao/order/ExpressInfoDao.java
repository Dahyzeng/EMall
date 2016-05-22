package emall.dao.order;

import emall.entity.ExpressInfo;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by taurin on 2016/5/19.
 */
@Repository
public class ExpressInfoDao {

    @Autowired
    private SessionFactory sessionFactory;
    public void addExpressInfo (ExpressInfo expressInfo) {
        sessionFactory.getCurrentSession().save(expressInfo);
    }

    public List getExpressInfo (String orderId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from ExpressInfo where orderId=?");
        query.setString(0, orderId);
        return query.list();
    }
}
