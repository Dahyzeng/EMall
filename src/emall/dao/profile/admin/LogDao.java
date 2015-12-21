package emall.dao.profile.admin;

import emall.entity.AdminLog;
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
     * add admin operation log
     * @param adminLog AdminLog entity
     */
    public void addLog(AdminLog adminLog) {
        sessionFactory.getCurrentSession().save(adminLog);
    }


    @Autowired

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
