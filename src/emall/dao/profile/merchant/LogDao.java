package emall.dao.profile.merchant;

import emall.entity.MerchantLog;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by taurinzeng on 2015/12/21.
 */

@Repository
public class LogDao {
    private SessionFactory sessionFactory;

    /**
     * function:
     * add merchant operation log
     * @param merchantLog MerchantLog entity
     */
    public void addLog(MerchantLog merchantLog) {
        sessionFactory.getCurrentSession().save(merchantLog);
    }

    /**
     * function:
     * get merchant's logs by page
     * @param merchantId start pageSize
     * @return logList
     */
    public List getMerchantLogByMerchantId(String merchantId, int start, int pageSize) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Merchant where merchantId=?");
        query.setString(0, merchantId);
        query.setFirstResult(start);
        query.setMaxResults(pageSize);
        return query.list();
    }

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
