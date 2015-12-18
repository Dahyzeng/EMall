package emall.web.component.admin.profile;

import emall.aop.annotation.CheckUsername;
import emall.entity.Admin;
import emall.service.admin.profile.InfoService;
import emall.util.string.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.logging.Logger;

/**
 * Created by Taurin on 2015/12/14.
 */
@Component
@RequestMapping("/admin")
public class Login {

    @Autowired
    private InfoService infoService;

    @RequestMapping("/login")
    @CheckUsername
    public ModelAndView login(@Valid Admin admin, BindingResult bindingResult){
        ModelAndView modelAndView = new ModelAndView();
        if(bindingResult.hasErrors()){
            modelAndView.setViewName("admin/profile/login");
        }else {
            int result = infoService.loginService(admin);
            if(result == 1) {
                modelAndView.addObject("login_exception", Constants.LOGIN_EXCEPTION);
                modelAndView.setViewName("admin/profile/login");
            }else {
                modelAndView.setViewName("admin/homepage");
            }
        }
        return  modelAndView;
    }

    @RequestMapping("/set")
    public void setUsername(HttpServletRequest request){
        request.getSession().setAttribute("username", "taurin");
    }
}
