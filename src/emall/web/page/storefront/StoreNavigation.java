package emall.web.page.storefront;

import emall.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by taurin on 2016/4/5.
 */
@Controller
public class StoreNavigation {
    @Autowired
    HttpServletRequest request;

    @RequestMapping("/home")
    public String homePage() {
        return "/index";
    }

    @RequestMapping("/cart")
    public String cartPage() {
        return "/store/cart";
    }

    @RequestMapping("/compare")
    public String comparePage() {
        return "/store/compare";
    }

    @RequestMapping("/contact_us")
    public String contactUsPage() {
        return "/store/contact_us";
    }

    @RequestMapping("/search_key/{key}")
    public ModelAndView searchPage(@PathVariable String key) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("key", key);
        mav.setViewName("/store/search");
        return mav;
    }

    @RequestMapping("/thanks")
    public ModelAndView thanksPage(String orderId) {
        ModelAndView mav = new ModelAndView();
        if (orderId == null) {
            mav.setViewName("redirect:/home");
            return mav;
        }
        mav.addObject("orderId", orderId);
        mav.setViewName("/store/order_thanks");
        return mav;
    }

    @RequestMapping("/search/{pageType}")
    public ModelAndView searchPage(@PathVariable String pageType,Category category) {
        ModelAndView mav = new ModelAndView();
        if (category.getFatherId() != 0) {
            mav.addObject("type", "f");
            mav.addObject("id", category.getFatherId());
        } else {
            mav.addObject("type", "c");
            mav.addObject("id", category.getCategoryId());
        }
        mav.addObject("name", category.getCategoryName());
        mav.setViewName("/store/product_grid");
        if ("list".equals(pageType)) {
            mav.setViewName("/store/product_list");
        }
        return mav;
    }

    @RequestMapping("/pdp/{itemId}")
    public ModelAndView itemDetailPage(@PathVariable String itemId) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("itemId", itemId);
        mav.setViewName("/store/pdp");
        return mav;
    }
}
