package emall.web.component.merchant.profile;

import emall.aop.annotation.CheckMerchantName;
import emall.entity.MallInfo;
import emall.entity.Merchant;
import emall.service.merchant.profile.InfoService;
import emall.util.file.UploadFile;
import emall.util.string.Constants;
import emall.util.string.constants.ErrorMessageConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by taurinzeng on 2015/12/18.
 */
@Component
@RequestMapping("/merchant")
public class UpdateInfo {
    @Autowired
    private InfoService infoService;
    @Autowired
    private UploadFile uploadFile;
    @Autowired
    private HttpServletRequest request;

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

    @RequestMapping("/update/mall")
    public ModelAndView updateMall(MallInfo mallInfo, MultipartFile file) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/merchant/info");
        if (file != null) {
            if (file.getSize() != 0) {
                try {
                    String savePicURL = uploadFile.uploadMallPic(request, file);
                    mallInfo.setStorePicURL(savePicURL);
                } catch (Exception e) {
                    e.printStackTrace();
                    mav.addObject("success", false);
                    mav.addObject("errorMessage", ErrorMessageConstant.SYSTEM_ERROR);
                    return mav;
                }
            }
        }
        if (infoService.updateMall(mallInfo) != Constants.SUCCESS_NUMBER) {
            mav.addObject("errorMessage", ErrorMessageConstant.SYSTEM_ERROR);
        }
        return mav;
    }

    @RequestMapping("/mall/get")
    @ResponseBody
    public Map getMallInfo() {
        Map<String, Object> map = new HashMap<String, Object>();
        Object merchantName = request.getSession().getAttribute("merchantName");
        if (merchantName == null) {
            map.put("success", false);
            map.put("errorMessage", ErrorMessageConstant.NO_LOGIN_ERROR);
        }
        map.put("success", true);
        map.put("mallInfo", infoService.getMall());
        return map;
    }

    @RequestMapping("/getAll")
    @ResponseBody
    public Map getMerchants() {
        Map<String, Object> map = new HashMap<String, Object>();
        Object merchantName = request.getSession().getAttribute("merchantName");
        if (merchantName == null) {
            map.put("success", false);
            map.put("errorMessage", ErrorMessageConstant.NO_LOGIN_ERROR);
        }
        map.put("merchantList", infoService.getMerchants());
        map.put("success", true);
        return map;
    }
}
