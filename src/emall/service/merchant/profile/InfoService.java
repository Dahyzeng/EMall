package emall.service.merchant.profile;

import emall.dao.profile.merchant.MallDao;
import emall.dao.profile.merchant.MerchantProfileDao;
import emall.entity.MallInfo;
import emall.entity.Merchant;
import emall.entity.MerchantLog;
import emall.service.merchant.log.LogService;
import emall.util.string.Constants;
import emall.util.string.constants.MerchantConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Service
@Transactional
public class InfoService {
    @Autowired
    private MerchantProfileDao merchantDao;
    @Autowired
    private MallDao mallDao;
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
        MerchantLog log = getAdminLog();
        StringBuilder logMessage = new StringBuilder();
        logMessage.append(MerchantConstants.ADD_ADMIN_LOG);
        logMessage.append(merchant.getMerchantName());
        log.setOperation(logMessage.toString());
        merchant.setCreateTime(log.getDate());
        logService.addMerchantLog(log);
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
        MerchantLog log;
        if (loginResult == 1) {
            List list = merchantDao.getMerchant(merchant.getEmail());
            if (!list.isEmpty()) {
                merchant = (Merchant)list.get(0);
                request.getSession().setAttribute("merchantName", merchant.getMerchantName());
                if (merchant.getIsAdmin() == 1)
                request.getSession().setAttribute("isAdmin", merchant.getIsAdmin());
            }
            log = getAdminLog();
            log.setOperation(MerchantConstants.LOGIN_SUCCESS_LOG_MESSAGE);
            logService.addMerchantLog(log);
        }
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
        MerchantLog log = getAdminLog();
        log.setOperation(MerchantConstants.UPDATE_PASSWORD_LOG);
        merchantDao.updatePassword(merchant);
        logService.addMerchantLog(log);
        return 1;
    }

    @Transactional(rollbackFor = Exception.class)
    public int updateMall(MallInfo mallInfo) {
        MerchantLog log = new MerchantLog();
        SimpleDateFormat toDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp date = Timestamp.valueOf(toDateTime.format(new Date().getTime()));
        log.setDate(date);
        log.setMerchantName(request.getSession().getAttribute("merchantName").toString());
        log.setOperation("update mall info");
        logService.addMerchantLog(log);
        mallDao.addOrUpdate(mallInfo);
        return Constants.SUCCESS_NUMBER;
    }

    public List getMerchants() {
        return merchantDao.getMerchants();
    }

    public MallInfo getMall() {
        return mallDao.getMallInfo();
    }

    public String getSessionName() {
        return request.getSession().getAttribute("merchantName").toString();
    }

    public MerchantLog getAdminLog() {
        SimpleDateFormat toDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp date = Timestamp.valueOf(toDateTime.format(new Date().getTime()));

        MerchantLog log = new MerchantLog();
        log.setMerchantName(getSessionName());
        log.setDate(date);
        return log;
    }
}
