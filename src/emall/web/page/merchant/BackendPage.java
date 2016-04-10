package emall.web.page.merchant;

import emall.aop.annotation.CheckMerchantName;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by taurinzeng on 2015/12/18.
 */
@Controller
@RequestMapping("/merchant")
public class BackendPage {

    @RequestMapping("/signIn")
    public String loginNavigate() {
        return "backend/login";
    }

    @RequestMapping("/home")
    public String homeNavigate(HttpServletRequest request) {
        Object merchantName = request.getSession().getAttribute("merchantName");
        if (merchantName == null) {
            return "redirect:/merchant/signIn";
        }
        return  "backend/index";
    }

    @RequestMapping("/category")
    @CheckMerchantName
    public String categoryNavigate(HttpServletRequest request) {
        Object merchantName = request.getSession().getAttribute("merchantName");
        if (merchantName == null) {
            return "redirect:/merchant/signIn";
        }
        return "backend/category";
    }
}
