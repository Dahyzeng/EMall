package emall.service.admin.profile;

import emall.dao.profile.admin.AdminDao;
import emall.entity.Admin;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class InfoService {
    private AdminDao adminDao;

    @Transactional(rollbackFor = Exception.class)
    public int addAdminService(Admin admin){
        adminDao.addAdmin(admin);
        return 1;
    }

    public int loginService(Admin admin){
        return adminDao.checkInfo(admin);
    }
}
