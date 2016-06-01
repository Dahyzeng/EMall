package emall.web.component.merchant.profile;

import emall.aop.annotation.CheckUsername;
import emall.entity.Merchant;
import emall.service.merchant.profile.InfoService;
import emall.util.encryption.EncryptionByMD5;
import emall.util.string.Constants;
import emall.util.string.constants.ErrorMessageConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

@Component
@RequestMapping("/merchant")
public class Register {
    @Autowired
    private InfoService infoService;

    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/addMerchant")
    @ResponseBody
    public Map addMerchant(Merchant merchant) throws NoSuchAlgorithmException {
        Map<String, Object> mav = new HashMap<String, Object>();
        Object admin = request.getSession().getAttribute("isAdmin");
        mav.put("success", true);
        if (admin == null) {
            mav.put("success", false);
            mav.put("errorMessage", ErrorMessageConstant.PERMISSION_ERROR);
            return mav;
        } else {
            String password = new EncryptionByMD5().encodeByMD5(merchant.getPassword());
            merchant.setPassword(password);
            infoService.addAdminService(merchant);
            return mav;
        }
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
