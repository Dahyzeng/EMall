package emall.dao.profile.admin;

import emall.entity.Admin;
import emall.util.string.Constants;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class AdminProfileDao {
    private SessionFactory sessionFactory;

    public void addAdmin(Admin admin){
        sessionFactory.getCurrentSession().save(admin);
    }

    /**
     * function:
     * admin login, check the admin information
     * @param admin admin info
     * @return
     * 0 login fail
     * 1 login success
     */
    public int checkInfo(Admin admin) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Admin where adminName=? and password=?");
        query.setString(0, admin.getUsername());
        query.setString(1, admin.getPassword());
        List list = query.list();
        if(list.size() == 0){
            return Constants.FAIL_NUMBER;
        }else {
            return Constants.SUCCESS_NUMBER;
        }
    }

    /**
     * function:
     * check whether admin name exist
     * @param adminName admin name
     * @return
     * 1 represent do exist
     * 0 represent do not
     */
    public int nameMatch(String adminName) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Admin where adminName=?");
        query.setString(0, adminName);
        List list = query.list();
        return list.size();
    }

    /**
     * function:
     * update admin password
     * @param admin admin
     */
    public void updatePassword(Admin admin) {
        sessionFactory.getCurrentSession().update(admin);
    }

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
