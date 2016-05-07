package emall.web.component.store;

import emall.dao.item.ItemBaseDao;
import emall.entity.Item;
import emall.service.merchant.item.ItemBaseService;
import emall.service.store.home.HomePageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taurin on 2016/4/17.
 */
@Controller
@RequestMapping("/store")
public class HomePageComponent {
    @Autowired
    private HomePageService homePageService;

    @Autowired
    private ItemBaseService itemBaseService;

    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/get_carousel")
    @ResponseBody
    public List getPageCarousel() {
        return homePageService.getAllCarousel();
    }

}
