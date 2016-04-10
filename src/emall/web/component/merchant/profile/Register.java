package emall.web.component.merchant.profile;

import emall.aop.annotation.CheckUsername;
import emall.entity.Merchant;
import emall.service.merchant.profile.InfoService;
import emall.util.string.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Component
@RequestMapping("/merchant")
public class Register {
    @Autowired
    private InfoService infoService;

    @RequestMapping("/addMerchant")
    @CheckUsername
    public ModelAndView addAdmin(@Valid Merchant merchant, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/merchant/addMerchant");
        if (bindingResult.hasErrors()) {
            return modelAndView;
        } else {
            int result = infoService.addAdminService(merchant);
            if (result == 1) {
                modelAndView.addObject(Constants.ADD_ADMIN_SUCCESS_MESSAGE);
            } else {
                modelAndView.addObject(Constants.ADD_ADMIN_FAIL_MESSAGE);
            }
        }
        return modelAndView;
    }

    @RequestMapping(value = "/nameUsable", method = RequestMethod.GET)
    @ResponseBody
    public int checkAdminNameUsable(String merchantName){
        if ("".equals(merchantName)) {
            return -1;
        } else {
            return infoService.merchantNameMatchService(merchantName);
        }
    }
}
