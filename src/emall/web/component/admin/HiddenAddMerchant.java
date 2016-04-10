package emall.web.component.admin;

import emall.entity.Merchant;
import emall.service.admin.AddMerchant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

/**
 * Created by taurin on 2016/4/8.
 */
@Component
@RequestMapping("/admin")
public class HiddenAddMerchant {
    @Autowired
    private AddMerchant addMerchant;

    @RequestMapping("/add_merchant")
    public String addMerchant(@Valid Merchant merchant, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "/admin/add_merchant";
        }
        addMerchant.hiddenAddMerchant(merchant);
        return "/backend/login";
    }
}
