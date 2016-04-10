package emall.aop.merchant;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import java.io.IOException;


@Aspect
@Component
public class InfoAspect {
    @Autowired
    HttpServletRequest request;

    @Before("@annotation(emall.aop.annotation.CheckMerchantName)")
    public void checkLogin(){
        System.out.print("get in check merchant name");

    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

}
