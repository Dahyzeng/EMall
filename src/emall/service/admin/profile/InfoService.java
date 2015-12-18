package emall.service.admin.profile;

import emall.dao.profile.admin.AdminProfileDao;
import emall.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class InfoService {
    @Autowired
    private AdminProfileDao adminDao;

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
    public int loginService(Admin admin){
        return adminDao.checkInfo(admin);
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

    @Transactional(rollbackFor = Exception.class)
    public int updatePassword(Admin admin) {
        adminDao.updatePassword(admin);
        return 1;
    }
}
