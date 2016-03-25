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

    public void addAdmin(Merchant merchant){
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
        Query query = sessionFactory.getCurrentSession().createQuery("from Merchant where merchantName=? and password=?");
        query.setString(0, merchant.getAdminName());
        query.setString(1, merchant.getPassword());
        List list = query.list();
        if(list.size() == 0){
            return Constants.FAIL_NUMBER;
        }else {
            return Constants.SUCCESS_NUMBER;
        }
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
     * @param merchant merchant
     */
    public void updatePassword(Merchant merchant) {
        sessionFactory.getCurrentSession().update(merchant);
    }

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
