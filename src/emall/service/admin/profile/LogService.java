package emall.service.admin.profile;

import emall.dao.profile.admin.LogDao;
import emall.entity.AdminLog;
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
     * add admin log, if there are any exception
     * the data will roll back.
     * @param adminLog adminLog entity
     */
    @Transactional(rollbackFor = Exception.class)
    public void addAdminLog (AdminLog adminLog) {
        logDao.addLog(adminLog);
    }
}
