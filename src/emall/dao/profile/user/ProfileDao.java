package emall.dao.profile.user;


import emall.entity.User;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
public class ProfileDao {


    private SessionFactory sessionFactory;
    public void userRegister(User user){
        sessionFactory.getCurrentSession().save(user);
    }


    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

}
