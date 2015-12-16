package emall.web.component;


import emall.entity.User;
import emall.service.user.profile.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Component
@RequestMapping(value = "/profile")
public class ProfileInfo {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/register")
    public String profileRegister(@Valid User user, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "/index";
        }else {
            int result = userService.UserRegister(user);
            if(result == 1){
                return "/index";
            }else {
                return "/index";
            }
        }
    }
}
