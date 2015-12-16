package emall.service.user.profile;


import emall.aop.annotation.CheckUsername;
import emall.dao.profile.user.ProfileDao;
import emall.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {
    @Autowired
    private ProfileDao profileDao;

    @Transactional(rollbackFor = Exception.class)
    @CheckUsername
    public int UserRegister(User user) {
        profileDao.userRegister(user);
        return 1;

    }
}
