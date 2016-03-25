package emall.web.component.merchant.profile;

import emall.aop.annotation.CheckUsername;
import emall.entity.Merchant;
import emall.service.merchant.profile.InfoService;
import emall.util.string.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

/**
 * Created by Taurin on 2015/12/14.
 */
@Component
@RequestMapping("/merchant")
public class Login {

    @Autowired
    private InfoService infoService;

    @RequestMapping("/login")
    @CheckUsername
    public ModelAndView login(@Valid Merchant merchant, BindingResult bindingResult){
        ModelAndView modelAndView = new ModelAndView();
        if(bindingResult.hasErrors()){
            modelAndView.setViewName("merchant/profile/login");
        }else {
            int result = infoService.loginService(merchant);
            if(result == 1) {
                modelAndView.addObject("login_exception", Constants.LOGIN_EXCEPTION);
                modelAndView.setViewName("merchant/profile/login");
            }else {
                modelAndView.setViewName("merchant/homepage");
            }
        }
        return  modelAndView;
    }

    @RequestMapping("/set")
    public void setUsername(HttpServletRequest request){
        request.getSession().setAttribute("username", "taurin");
    }
}
