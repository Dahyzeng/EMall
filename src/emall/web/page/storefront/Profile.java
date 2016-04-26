package emall.web.page.storefront;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by taurin on 2016/4/5.
 */
@Controller
public class Profile {
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

}
