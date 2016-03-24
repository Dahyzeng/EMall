package emall.service.admin.profile;

import emall.dao.profile.admin.AdminProfileDao;
import emall.entity.Admin;
import emall.entity.AdminLog;
import emall.util.string.Constants;
import emall.util.string.constants.AdminConstants;
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
    private AdminProfileDao adminDao;
    @Autowired
    private LogService logService;

    @Autowired
    private HttpServletRequest request;
    /**
     * function:
     * add admin service
     * if there are any exceptions,
     * the data will roll back and return
     * a default value 0 for fail
     * @param admin admin info
     * @return 1 for success
     */
    @Transactional(rollbackFor = Exception.class)
    public int addAdminService(Admin admin){
        AdminLog log = getAdminLog(admin);
        StringBuilder logMessage = new StringBuilder();
        logMessage.append("管理员：");
        logMessage.append(getSessionName());
        logMessage.append(",");
        logMessage.append(AdminConstants.ADD_ADMIN_LOG);
        logMessage.append(admin.getAdminName());
        log.setOperation(logMessage.toString());
        logService.addAdminLog(log);
        adminDao.addAdmin(admin);
        return 1;
    }

    /**
     * function:
     * admin login service
     * @param admin admin info
     * @return
     * 0 login fail
     * 1 login success
     */
    @Transactional(rollbackFor = Exception.class)
    public int loginService(Admin admin){
        int loginResult = adminDao.checkInfo(admin);
        AdminLog log = getAdminLog(admin);
        if (loginResult == 1) {
            log.setOperation(AdminConstants.LOGIN_SUCCESS_LOG_MESSAGE);
        }else {
            log.setOperation(AdminConstants.LOGIN_FAIL__LOG_MESSAGE);
        }
        logService.addAdminLog(log);
        return loginResult;
    }

    /**
     * function:
     * check whether admin name exist service
     * @param adminName admin name
     * @return
     * 1 represent do exist
     * 0 represent do not
     */
    public int adminNameMatchService(String adminName) {
        return adminDao.nameMatch(adminName);
    }

    /**
     * function:
     * admin update password, if there are any
     * exception, the data will be rolled back
     * @param admin admin entity
     * @return
     * 1 represent success
     * 0 represent fail
     */
    @Transactional(rollbackFor = Exception.class)
    public int updatePassword(Admin admin) {
        AdminLog log = getAdminLog(admin);
        log.setOperation(AdminConstants.UPDATE_PASSWORD_LOG);
        adminDao.updatePassword(admin);
        logService.addAdminLog(log);
        return 1;
    }

    public String getSessionName() {
        return request.getSession().getAttribute("adminName").toString();
    }

    public AdminLog getAdminLog(Admin admin) {
        Timestamp date = new Timestamp(new Date().getTime());
        AdminLog log = new AdminLog();
        log.setAdminName(admin.getAdminName());
        log.setDate(date);
        return log;
    }
}
