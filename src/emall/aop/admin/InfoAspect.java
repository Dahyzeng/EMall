package emall.aop.admin;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import javax.servlet.http.HttpServletRequest;


@Aspect
@Component
public class InfoAspect {
    @Autowired
    HttpServletRequest request;

    @Before("@annotation(emall.aop.annotation.CheckUsername)")
    public void checkLogin(){
        String username = (String) request.getSession().getAttribute("username");
        System.out.println("aop get in");
        System.out.println("aspect get username:"+username);
    }
}
