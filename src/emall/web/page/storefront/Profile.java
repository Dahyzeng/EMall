package emall.web.page.storefront;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by taurin on 2016/4/5.
 */
@Controller
public class Profile {
    @Autowired
    HttpServletRequest request;
    @RequestMapping("/login")
    public ModelAndView loginPage(String url) {
        ModelAndView modelAndView = new ModelAndView();
        if (url != null) {
            modelAndView.addObject("url", url);
        }
        modelAndView.setViewName("/store/login");
        return modelAndView;
    }

    @RequestMapping("/register")
    public String registerPage() {
        return "/store/register";
    }

    @RequestMapping("/account")
    public String myAccountPage() {
        Object username = request.getSession().getAttribute("username");
        if (username == null) {
            return "/store/login";
        } else
        return "/store/personal_info";
    }

    @RequestMapping("/account/address")
    public String addressPage() {
        Object username = request.getSession().getAttribute("username");
        if (username == null) {
            return "/store/login";
        } else
            return "/store/address";
    }

    @RequestMapping("/checkout")
    public String checkoutPage() {
        Object username = request.getSession().getAttribute("username");
        if (username == null) {
            return "/store/login";
        } else {
            Object step = request.getSession().getAttribute("checkoutStep");
            if (step == null) {
                return "redirect:/cart";
            } else {
                return "/store/checkout";
            }
        }
    }
}
