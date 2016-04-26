package emall.service.admin;

import emall.dao.profile.merchant.MerchantProfileDao;
import emall.entity.Merchant;
import emall.util.encryption.EncryptionByMD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.security.NoSuchAlgorithmException;

/**
 * Created by taurin on 2016/4/8.
 */
@Service
public class AddMerchant {
    @Autowired
    private MerchantProfileDao merchantProfileDao;

    @Transactional(rollbackFor = Exception.class)
    public int hiddenAddMerchant(Merchant merchant) {
        int result;
        try {
            merchant.setPassword(new EncryptionByMD5().encodeByMD5(merchant.getPassword()));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        merchantProfileDao.addMerchant(merchant);
        result = 1;
        return result;
    }

    public void setMerchantProfileDao(MerchantProfileDao merchantProfileDao) {
        this.merchantProfileDao = merchantProfileDao;
    }
}
