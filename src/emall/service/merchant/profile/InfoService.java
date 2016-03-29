package emall.service.merchant.profile;

import emall.dao.profile.merchant.MerchantProfileDao;
import emall.entity.Merchant;
import emall.entity.MerchantLog;
import emall.util.string.constants.MerchantConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.Date;


@Service
@Transactional
public class InfoService {
    @Autowired
    private MerchantProfileDao merchantDao;
    @Autowired
    private LogService logService;

    @Autowired
    private HttpServletRequest request;
    /**
     * function:
     * add merchant service
     * if there are any exceptions,
     * the data will roll back and return
     * a default value 0 for fail
     * @param merchant merchant info
     * @return 1 for success
     */
    @Transactional(rollbackFor = Exception.class)
    public int addAdminService(Merchant merchant){
        MerchantLog log = getAdminLog(merchant);
        StringBuilder logMessage = new StringBuilder();
        logMessage.append("管理员：");
        logMessage.append(getSessionName());
        logMessage.append(",");
        logMessage.append(MerchantConstants.ADD_ADMIN_LOG);
        logMessage.append(merchant.getMerchantName());
        log.setOperation(logMessage.toString());
        logService.addAdminLog(log);
        merchantDao.addMerchant(merchant);
        return 1;
    }

    /**
     * function:
     * merchant login service
     * @param merchant merchant info
     * @return
     * 0 login fail
     * 1 login success
     */
    @Transactional(rollbackFor = Exception.class)
    public int loginService(Merchant merchant){
        int loginResult = merchantDao.checkInfo(merchant);
        MerchantLog log = getAdminLog(merchant);
        if (loginResult == 1) {
            log.setOperation(MerchantConstants.LOGIN_SUCCESS_LOG_MESSAGE);
        }else {
            log.setOperation(MerchantConstants.LOGIN_FAIL__LOG_MESSAGE);
        }
        logService.addAdminLog(log);
        return loginResult;
    }

    /**
     * function:
     * check whether merchant name exist service
     * @param merchantName merchant name
     * @return
     * 1 represent do exist
     * 0 represent do not
     */
    public int merchantNameMatchService(String merchantName) {
        return merchantDao.nameMatch(merchantName);
    }

    /**
     * function:
     * merchant update password, if there are any
     * exception, the data will be rolled back
     * @param merchant merchant entity
     * @return
     * 1 represent success
     * 0 represent fail
     */
    @Transactional(rollbackFor = Exception.class)
    public int updatePassword(Merchant merchant) {
        MerchantLog log = getAdminLog(merchant);
        log.setOperation(MerchantConstants.UPDATE_PASSWORD_LOG);
        merchantDao.updatePassword(merchant);
        logService.addAdminLog(log);
        return 1;
    }

    public String getSessionName() {
        return request.getSession().getAttribute("merchantName").toString();
    }

    public MerchantLog getAdminLog(Merchant merchant) {
        Timestamp date = new Timestamp(new Date().getTime());
        MerchantLog log = new MerchantLog();
        log.setMerchantName(merchant.getMerchantName());
        log.setDate(date);
        return log;
    }
}
