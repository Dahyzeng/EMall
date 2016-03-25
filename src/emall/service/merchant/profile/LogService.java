package emall.service.merchant.profile;

import emall.dao.profile.merchant.LogDao;
import emall.entity.MerchantLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by taurinzeng on 2015/12/21.
 */
@Service
public class LogService {
    @Autowired
    private LogDao logDao;

    /**
     * function:
     * add merchant log, if there are any exception
     * the data will roll back.
     * @param merchantLog merchantLog entity
     */
    @Transactional(rollbackFor = Exception.class)
    public void addAdminLog (MerchantLog merchantLog) {
        logDao.addLog(merchantLog);
    }
}
