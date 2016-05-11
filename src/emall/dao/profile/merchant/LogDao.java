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
     * @param merchantName start pageSize
     * @return logList
     */
    public List getLogByName(String merchantName, int page, int pageSize) {
        Query query = sessionFactory.getCurrentSession().createQuery("from MerchantLog where merchantName=? order by date DESC ");
        query.setString(0, merchantName);
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);
        return query.list();
    }

    public List getAllLog(int page, int pageSize) {
        Query query = sessionFactory.getCurrentSession().createQuery("from MerchantLog order by date DESC");
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);
        return query.list();
    }

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
