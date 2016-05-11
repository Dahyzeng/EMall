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
    @Autowired
    private SessionFactory sessionFactory;
    public void userRegister(User user){
        sessionFactory.getCurrentSession().save(user);
    }

    public void userUpdate(User user) {
        Query query = sessionFactory.getCurrentSession().createQuery("update User set username=?, birthday=?, gender=? where userId=?");
        query.setString(0, user.getUsername());
        query.setDate(1, user.getBirthday());
        query.setString(2, user.getGender());
        query.setInteger(3, user.getUserId());
        query.executeUpdate();
    }

    public void passwordUpdate(String password, int userId) {
        Query query = sessionFactory.getCurrentSession().createQuery("update User set password=? where userId=?");
        query.setString(0, password);
        query.setInteger(1, userId);
        query.executeUpdate();
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

    public List getUserById(int userId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from User where userId=?");
        query.setInteger(0, userId);
        return query.list();
    }

    public String getUserName(int userId) {
        Query query = sessionFactory.getCurrentSession().createQuery("select username from User where userId=?");
        query.setInteger(0, userId);
        return query.list().get(0).toString();
    }

    public List getUserByEmail(String email) {
        Query query = sessionFactory.getCurrentSession().createQuery("from User where email=?");
        query.setString(0, email);
        return query.list();
    }

}
