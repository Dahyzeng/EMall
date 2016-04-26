package emall.web.page.merchant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by taurinzeng on 2015/12/18.
 */
@Controller
@RequestMapping("/merchant")
public class BackendPage {

    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/signIn")
    public String loginNavigate() {
        return "backend/login";
    }

    @RequestMapping("/home")
    public ModelAndView homeNavigate() {
        ModelAndView mav = commonFunction("/index");
        if (!"redirect:/merchant/signIn".equals(mav.getViewName())) {
            mav.addObject("activeTab", "home");
        }
        return mav;
    }

    @RequestMapping("/category")
    public ModelAndView categoryNavigate() {
        ModelAndView mav = commonFunction("/category");
        if (!"redirect:/merchant/signIn".equals(mav.getViewName())) {
            mav.addObject("activeTab", "category");
        }
        return mav;
    }

    @RequestMapping("/product")
    public ModelAndView productNavigate(String success) {
        ModelAndView mav = commonFunction("/product");
        if (!"redirect:/merchant/signIn".equals(mav.getViewName())) {
            if ("true".equals(success)) {
                mav.addObject("success", true);
            }
            mav.addObject("activeTab", "product");
        }
        return mav;
    }
    @RequestMapping("/product/{operation}")
    public ModelAndView productEditNavigate(@PathVariable("operation") String operation, String itemId) {
        ModelAndView mav = commonFunction("/product_edit");
        if (!"redirect:/merchant/signIn".equals(mav.getViewName())) {
            if ("add".equals(operation)) {
                mav.addObject("operationMessage", "Add A New Item");
            } else if ("edit".equals(operation)) {
                mav.setViewName("redirect:/item/edit/" + itemId);
                return mav;
            } else {
                mav.setViewName("/404");
            }
            mav.addObject("activeTab", "product");
        }
        return mav;
    }

    @RequestMapping("/product/pic/{itemId}")
    public ModelAndView productAddPicNavigate(@PathVariable String itemId, String success) {
        ModelAndView mav = commonFunction("/item_pic");
        if (!"redirect:/merchant/signIn".equals(mav.getViewName())) {
            mav.addObject("success", success);
            mav.addObject("activeTab", "product");
            mav.addObject("itemId", itemId);
        }
        return mav;
    }

    @RequestMapping("/product/carousel/{itemId}")
    public ModelAndView productCarouse(@PathVariable String itemId, String success) {
        ModelAndView mav = commonFunction("/home_page_carousel");
        if (!"redirect:/merchant/signIn".equals(mav.getViewName())) {
            mav.addObject("success", success);
            mav.addObject("activeTab", "product");
            mav.addObject("itemId", itemId);
        }
        return mav;
    }
    public ModelAndView commonFunction(String url) {
        ModelAndView mav = new ModelAndView();
        Object merchantName = request.getSession().getAttribute("merchantName");
        if (merchantName == null) {
            mav.setViewName("redirect:/merchant/signIn");
        } else {
            mav.setViewName("/backend" + url);
        }
        return mav;
    }
}
