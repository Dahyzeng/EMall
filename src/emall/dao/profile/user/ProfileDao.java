package emall.dao.profile.user;


import emall.entity.User;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProfileDao {


    private SessionFactory sessionFactory;
    public void userRegister(User user){
        sessionFactory.getCurrentSession().saveOrUpdate(user);
    }

    public List nameMatch(String username) {
        Query query = sessionFactory.getCurrentSession().createQuery("from User where username=?");
        query.setString(0, username);
        return query.list();
    }

    public int emailMatch(String email) {
        Query query = sessionFactory.getCurrentSession().createQuery("from  User where email=?");
        query.setString(0, email);
        return query.list().size();
    }

    public int checkLoginInfo(String password, String email) {
        Query query = sessionFactory.getCurrentSession().createQuery("from User where password=? and email=?");
        query.setString(0, password);
        query.setString(1, email);
        return query.list().size();
    }

    public List getUserById(String userId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from User where userId=?");
        query.setString(0, userId);
        return query.list();
    }

    public List getUserByEmail(String email) {
        Query query = sessionFactory.getCurrentSession().createQuery("from User where email=?");
        query.setString(0, email);
        return query.list();
    }

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

}
