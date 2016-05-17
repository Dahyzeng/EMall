package emall.dao.profile.user;

import emall.entity.Address;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by taurin on 2016/4/29.
 */
@Repository
public class AddressDao {
    @Autowired
    SessionFactory sessionFactory;

    public List getUserAddress(int userId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Address where userId=?");
        query.setInteger(0, userId);
        return query.list();
    }

    public void addAddress(Address address) {
        sessionFactory.getCurrentSession().saveOrUpdate(address);
    }

    public List getAddressByAddressId(int addressId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Address where addressId=?");
        query.setInteger(0, addressId);
        return query.list();
    }
    public void deleteAddress(int addressId) {
        Query query = sessionFactory.getCurrentSession().createQuery("delete Address where addressId=?");
        query.setInteger(0, addressId);
        query.executeUpdate();
    }
}
