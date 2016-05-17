package emall.service.user.address;

import emall.dao.profile.user.AddressDao;
import emall.entity.Address;
import emall.util.string.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by taurin on 2016/4/29.
 */
@Service
public class AddressService {
    @Autowired
    private AddressDao addressDao;

    public List getUserAddress(int userId) {
        return addressDao.getUserAddress(userId);
    }

    @Transactional(rollbackFor = Exception.class)
    public int addOrUpdateAddress(Address address) {
        addressDao.addAddress(address);
        return Constants.SUCCESS_NUMBER;
    }

    public Address getAddressById(int addressId) {
        List list = addressDao.getAddressByAddressId(addressId);
        return (Address) list.get(0);
    }
    public void deleteAddress(int addressId) {
        addressDao.deleteAddress(addressId);
    }
}
