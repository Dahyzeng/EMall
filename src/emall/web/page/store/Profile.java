package emall.web.page.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by taurin on 2016/4/5.
 */
@Controller
public class Profile {
    @RequestMapping("/login")
    public String loginPage() {
        return "store/login";
    }
}
