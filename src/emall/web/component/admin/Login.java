package emall.web.component.admin;

import emall.aop.annotation.CheckUsername;
import emall.service.admin.profile.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

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
    public void login(){
        System.out.println("web login");
    }



    @RequestMapping("/set")
    public void setUsername(HttpServletRequest request){
        request.getSession().setAttribute("username", "taurin");
    }
}
