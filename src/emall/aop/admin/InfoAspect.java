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

    @Before("@annotation(emall.aop.annotation.CheckAdminName)")
    public void checkLogin(){
        Object adminName = request.getSession().getAttribute("adminName");
        if (adminName == null) {
            request.getRequestURL();
        }
    }
}
