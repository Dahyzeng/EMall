package emall.service.merchant.log;

import emall.dao.profile.merchant.LogDao;
import emall.entity.MerchantLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by taurin on 2016/5/8.
 */
@Service
public class LogService {
    @Autowired
    private LogDao logDao;

    public void addMerchantLog(MerchantLog merchantLog) {
        logDao.addLog(merchantLog);
    }

    public Map getLogByName(String name, int page, int pageSize) {
        return logDao.getLogByName(name, page, pageSize);
    }

    public Map getLog(int page, int pageSize) {
        return logDao.getAllLog(page, pageSize);
    }
}
