package emall.web.component.merchant.profile;

import emall.entity.Merchant;
import emall.service.merchant.profile.InfoService;
import emall.util.encryption.EncryptionByMD5;
import emall.util.string.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Taurin on 2015/12/14.
 */
@Component
@RequestMapping("/merchant")
public class Login {

    @Autowired
    private InfoService infoService;

    @RequestMapping("/login")
    @ResponseBody
    public Map<String, Object> login(String email, String password) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        try {
            password = new EncryptionByMD5().encodeByMD5(password);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            resultMap.put("msg", Constants.LOGIN_EXCEPTION);
        }
        int result = infoService.loginService(new Merchant(email, password));
        if (result != 1) {
            resultMap.put("success", 0);
            resultMap.put("msg", Constants.LOGIN_EXCEPTION);
        } else {
            resultMap.put("success", 1);
        }

        return resultMap;
    }



    @RequestMapping("/set")
    public void setUsername(HttpServletRequest request) {
        request.getSession().setAttribute("username", "taurin");
    }
}
