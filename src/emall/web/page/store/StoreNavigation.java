package emall.web.page.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by taurin on 2016/4/5.
 */
@Controller
public class StoreNavigation {
    @RequestMapping("/home")
    public String homePage() {
        return "/index";
    }
}
