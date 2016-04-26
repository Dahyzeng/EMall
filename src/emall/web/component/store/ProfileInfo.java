package emall.web.component.store;


import emall.entity.User;
import emall.service.user.profile.ProfileService;
import emall.util.encryption.EncryptionByMD5;
import emall.util.string.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
@RequestMapping(value = "/profile")
public class ProfileInfo {

    @Autowired
    private ProfileService profileService;

    @Autowired
    private HttpServletRequest request;

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Map profileRegister(User user){
        Map<String, Object> registerMap = new HashMap<String, Object>();
        registerMap.put("success", false);
        if (profileService.emailMatch(user.getEmail()) == 1) {
            registerMap.put("message", "email is exist");
            return registerMap;
        }
        if (profileService.nameMatch(user.getUsername()) == 1) {
            registerMap.put("message", "name is exist");
            return registerMap;
        }
        try {
            String password = new EncryptionByMD5().encodeByMD5(user.getPassword());
            user.setPassword(password);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            registerMap.put("message", "system error");
            return registerMap;
        }
        if (profileService.addUser(user) == Constants.SUCCESS_NUMBER) {
            registerMap.put("success", true);
        }
        return registerMap;
    }

    @RequestMapping("/login")
    @ResponseBody
    public Map profileLogin(String email, String password) {
        Map<String, Object> loginMap = new HashMap<String, Object>();
        loginMap.put("success", false);
        try {
            String encodePassword = new EncryptionByMD5().encodeByMD5(password);
            if (profileService.checkLoginInfo(email, encodePassword) == Constants.SUCCESS_NUMBER) {
                List list = profileService.getUserByEmail(email);
                if (list.size() != 0) {
                    User user = (User) list.get(0);
                    request.getSession().setAttribute("username", user.getUsername());
                    request.getSession().setAttribute("userId", user.getUserId());
                }
                loginMap.put("success", true);
            } else {
                loginMap.put("message", "username and password do not match");
            }
            return loginMap;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            loginMap.put("message", "system error");
            return loginMap;
        }
    }
}
