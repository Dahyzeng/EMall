package emall.web.component.merchant.profile;

import emall.aop.annotation.CheckMerchantName;
import emall.entity.Merchant;
import emall.service.merchant.profile.InfoService;
import emall.util.string.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by taurinzeng on 2015/12/18.
 */
@Component
@RequestMapping("/merchant")
public class UpdateInfo {
    @Autowired
    private InfoService infoService;

    @RequestMapping("/update/password")
    @CheckMerchantName
    public ModelAndView UpdatePassword(Merchant merchant) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/merchant/profile/updatePassword");
        if("".equals(merchant.getPassword())) {
            return modelAndView;
        }else {
            int result = infoService.updatePassword(merchant);
            if(result == 1) {
                modelAndView.addObject(Constants.UPDATE_SUCCESS_MESSAGE);
            }else {
                modelAndView.addObject(Constants.UPDATE_FAIL_MESSAGE);
            }
        }
        return modelAndView;
    }
}
