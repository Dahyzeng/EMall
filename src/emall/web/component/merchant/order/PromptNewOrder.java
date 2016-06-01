package emall.web.component.merchant.order;

import emall.util.DwrScriptSessionManagerUtil;
import org.directwebremoting.ScriptSession;
import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by taurin on 2016/5/31.
 */
@Controller
@RemoteProxy(name = "promptNewOrder")
public class PromptNewOrder {

    @Autowired
    HttpServletRequest request;
    @RemoteMethod
    public Object prompt() {
        ServletContext application = request.getServletContext();
        return application.getAttribute("newOrder");
    }
}
