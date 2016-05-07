package emall.service.user.address;

import emall.dao.profile.user.AddressDao;
import emall.entity.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by taurin on 2016/4/29.
 */
@Service
public class AddressService {
    @Autowired
    private AddressDao addressDao;

    public List getUserAddress(String userId) {
        return addressDao.getUserAddress(userId);
    }

    public void addOrUpdateAddress(Address address) {
        addressDao.addAddress(address);
    }

    public void deleteAddress(String addressId) {
        addressDao.deleteAddress(addressId);
    }
}
