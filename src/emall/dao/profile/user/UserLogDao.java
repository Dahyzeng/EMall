package emall.dao.profile.user;

import emall.entity.UserLog;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by taurin on 2016/4/19.
 */
@Repository
public class UserLogDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void addLog(UserLog userLog) {
        sessionFactory.getCurrentSession().persist(userLog);
    }
}
