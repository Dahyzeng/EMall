package emall.dao.order;

import emall.entity.ItemEvaluate;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by taurin on 2016/5/29.
 */
@Repository
public class EvaluateDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void addEvaluate (ItemEvaluate itemEvaluate) {
        sessionFactory.getCurrentSession().save(itemEvaluate);
    }

    public List getItemEvaluate(int itemId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from ItemEvaluate where itemId=?");
        query.setInteger(0, itemId);
        return query.list();
    }

    public Double getAverage () {
        Query query = sessionFactory.getCurrentSession().createQuery("select AVG(qualityLevel) from ItemEvaluate");
        return (Double) query.uniqueResult();
    }
}
