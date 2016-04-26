package emall.service.user.profile;

import emall.dao.profile.user.ProfileDao;
import emall.dao.profile.user.UserLogDao;
import emall.entity.User;
import emall.entity.UserLog;
import emall.util.string.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * Created by taurin on 2016/4/19.
 */
@Service
public class ProfileService {
    @Autowired
    private ProfileDao profileDao;

    @Autowired
    private UserLogDao userLogDao;

    @Transactional(rollbackFor = Exception.class)
    public int addUser(User user) {
        if (profileDao.nameMatch(user.getUsername()).size() != 0) {
            return Constants.FAIL_NUMBER;
        }
        if (profileDao.emailMatch(user.getEmail()) != 0) {
            return Constants.FAIL_NUMBER;
        }
        profileDao.userRegister(user);
        UserLog userLog = getUserLog(user);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("register or update an account named ");
        stringBuilder.append(user.getUsername());
        userLog.setOperation(stringBuilder.toString());
        userLogDao.addLog(userLog);
        return Constants.SUCCESS_NUMBER;
    }

    @Transactional(rollbackFor = Exception.class)
    public int checkLoginInfo(String email, String password) {
        UserLog userLog = getUserLog(new User(password, email));
        if (profileDao.checkLoginInfo(password, email) == 1) {
            userLog.setOperation("login successful");
            userLogDao.addLog(userLog);
            return Constants.SUCCESS_NUMBER;
        } else {
            userLog.setOperation("login Fail");
            userLogDao.addLog(userLog);
            return Constants.FAIL_NUMBER;
        }

    }

    public List getUserByEmail(String email) {
        return profileDao.getUserByEmail(email);
    }

    public int nameMatch(String username) {
        return profileDao.nameMatch(username).size();
    }
    public int emailMatch(String email) {
        return profileDao.emailMatch(email);
    }
    public UserLog getUserLog(User user) {
        Timestamp date = new Timestamp(new Date().getTime());
        UserLog log = new UserLog();
        log.setUsername(user.getUsername());
        log.setOperationDate(date);
        return log;
    }
}
