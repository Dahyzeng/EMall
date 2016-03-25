package emall.dao.profile.merchant;

import emall.entity.MerchantLog;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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


    @Autowired

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
