package emall.dao.profile.admin;

import emall.entity.Admin;
import emall.util.string.Constants;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class AdminDao {
    private SessionFactory sessionFactory;

    public void addAdmin(Admin admin){
        sessionFactory.getCurrentSession().save(admin);
    }

    public int checkInfo(Admin admin){
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

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
