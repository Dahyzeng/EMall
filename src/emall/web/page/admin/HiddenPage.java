package emall.web.page.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by taurin on 2016/4/8.
 */
@Controller
public class HiddenPage {

    @RequestMapping("/hidden/page/add_merchant")
    public String addMerchantPage() {
        return "admin/add_merchant";
    }
}
