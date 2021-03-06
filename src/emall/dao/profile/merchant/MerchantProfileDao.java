package emall.dao.profile.merchant;

import emall.entity.Merchant;
import emall.util.string.Constants;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class MerchantProfileDao {
    private SessionFactory sessionFactory;

    public void addMerchant(Merchant merchant){
        sessionFactory.getCurrentSession().save(merchant);
    }

    /**
     * function:
     * merchant login, check the merchant information
     * @param merchant merchant info
     * @return
     * 0 login fail
     * 1 login success
     */
    public int checkInfo(Merchant merchant) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Merchant where email=? and password=?");
        query.setString(0, merchant.getEmail());
        query.setString(1, merchant.getPassword());
        List list = query.list();
        if(list.size() == 0){
            return Constants.FAIL_NUMBER;
        }else {
            return Constants.SUCCESS_NUMBER;
        }
    }

    public List getMerchant(String email) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Merchant where email=?");
        query.setString(0, email);
        return query.list();
    }

    public List getMerchants() {
        Query query = sessionFactory.getCurrentSession().createQuery("from Merchant");
        return query.list();
    }

    /**
     * function:
     * check whether merchant name exist
     * @param  merchantName
     * @return
     * 1 represent do exist
     * 0 represent do not
     */
    public int nameMatch(String merchantName) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Merchant where merchantName=?");
        query.setString(0, merchantName);
        List list = query.list();
        return list.size();
    }

    /**
     * function:
     * update merchant password
     */
    public void updatePassword(String password, String merchantName) {
        Query query = sessionFactory.getCurrentSession().createQuery("update Merchant set password=? where merchantName=?");
        query.setString(0, password);
        query.setString(1, merchantName);
        query.executeUpdate();
    }

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
