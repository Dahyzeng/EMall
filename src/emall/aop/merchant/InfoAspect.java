package emall.aop.merchant;

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

    @Before("@annotation(emall.aop.annotation.CheckMerchantName)")
    public void checkLogin(){
        Object merchantName = request.getSession().getAttribute("merchantName");
        if (merchantName == null) {
            request.getRequestURL();
        }
    }
}
