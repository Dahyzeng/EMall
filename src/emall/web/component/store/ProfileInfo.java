package emall.web.component.store;


import emall.entity.Address;
import emall.entity.User;
import emall.service.user.address.AddressService;
import emall.service.user.order.OrderService;
import emall.service.user.profile.ProfileService;
import emall.util.EmailSender;
import emall.util.encryption.EncryptionByMD5;
import emall.util.string.Constants;
import emall.util.string.constants.EmailConstant;
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
import java.util.Random;

@Component
@RequestMapping(value = "/profile")
public class ProfileInfo {

    @Autowired
    private ProfileService profileService;

    @Autowired
    private AddressService addressService;

    @Autowired
    private OrderService orderService;

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
            List list = profileService.getUserByEmail(user.getEmail());
            if (list.size() != 0) {
                User user1 = (User) list.get(0);
                request.getSession().setAttribute("username", user1.getUsername());
                request.getSession().setAttribute("userId", user1.getUserId());
                request.getSession().setAttribute("email", user1.getEmail());
            }
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
                    request.getSession().setAttribute("email", user.getEmail());
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

    @RequestMapping("/logout")
    @ResponseBody
    public Map profileLogout() {
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        request.getSession().removeAttribute("username");
        request.getSession().removeAttribute("userId");
        request.getSession().removeAttribute("email");
        map.put("success", false);
        return map;
    }

    @RequestMapping("/account")
    @ResponseBody
    public Map getProfileInfo() {
        Map<String, Object> personalMap = new HashMap<String, Object>();
        Object userId = request.getSession().getAttribute("userId");
        if (userId == null) {
            personalMap.put("success", false);
            personalMap.put("errorMessage", "no_login");
            return personalMap;
        }
        User user = (User) profileService.getUserById((Integer)userId).get(0);
        personalMap.put("success", true);
        personalMap.put("personalInfo", user);
        return personalMap;
    }

    @RequestMapping("/update")
    @ResponseBody
    public Map updateProfileInfo(User user) {
        Map<String, Object> personalMap = new HashMap<String, Object>();
        Object userId = request.getSession().getAttribute("userId");
        if (userId == null) {
            personalMap.put("success", false);
            personalMap.put("errorMessage", "no_login");
            return personalMap;
        }
        user.setUserId((Integer)userId);
        if (profileService.updateUser(user) == 1) {
            personalMap.put("success", true);
        } else {
            personalMap.put("success", false);
        }
        return personalMap;
    }

    @RequestMapping("/update_password")
    @ResponseBody
    public Map updatePassword(String oldPassword, String newPassword) throws NoSuchAlgorithmException {
        Map<String, Object> personalMap = new HashMap<String, Object>();
        personalMap.put("success", false);
        Object userId = request.getSession().getAttribute("userId");
        if (userId == null) {
            personalMap.put("errorMessage", "no_login");
            return personalMap;
        }
        String email = request.getSession().getAttribute("email").toString();
        String encodePassword = new EncryptionByMD5().encodeByMD5(oldPassword);
        if (profileService.checkLoginInfo(email, encodePassword) != 1) {
            personalMap.put("errorMessage", "old password error");
            return personalMap;
        }
        String password = new EncryptionByMD5().encodeByMD5(newPassword);
        String username = (String) request.getSession().getAttribute("username");

        if (profileService.updatePassword(username, (Integer)userId, password) == 1) {
            personalMap.put("success", true);
        } else {
            personalMap.put("errorMessage", "update failed");
        }
        return personalMap;
    }

    @RequestMapping("update_email")
    @ResponseBody
    public Map updateEmail(String email, String code) {
        Object userId = request.getSession().getAttribute("userId").toString();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("success", false);
        if (userId == null) {
            map.put("errorMessage", "login first");
            return map;
        }
        String v_code = (String) request.getSession().getAttribute("verificationCode");
        if (!code.equals(v_code)) {
            map.put("errorMessage", "code error");
            return map;
        }
        String username = (String) request.getSession().getAttribute("username");
        if (profileService.updateEmail(email, Integer.parseInt(userId.toString()), username) == 1) {
            map.put("success", true);
        }
        return map;
    }

    @RequestMapping("/code")
    @ResponseBody
    public void sendEmailCode(String email) {
        String code = "";
        for (int i = 0; i < 5; i++) {
            code += new Random().nextInt(10);
        }
        request.getSession().setAttribute("verificationCode", code);
        new EmailSender().sendEmail(email, EmailConstant.EMAIL_CODE_SUBJECT, EmailConstant.EMAIL_CODE_CONTENT + code);
    }
}
