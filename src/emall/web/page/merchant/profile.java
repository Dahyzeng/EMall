package emall.web.page.merchant;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by taurinzeng on 2015/12/18.
 */
@Component
@RequestMapping("/profile")
public class profile {

    @RequestMapping("/login")
    public String loginNavigate() {
        return "/merchant/profile/login";
    }

}
