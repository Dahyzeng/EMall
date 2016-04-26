package emall.web.component.store;

import emall.service.store.home.HomePageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by taurin on 2016/4/17.
 */
@Controller
@RequestMapping("/store")
public class HomePageComponent {
    @Autowired
    private HomePageService homePageService;

    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/get_carousel")
    @ResponseBody
    public List getPageCarousel() {
        return homePageService.getAllCarousel();
    }
}
