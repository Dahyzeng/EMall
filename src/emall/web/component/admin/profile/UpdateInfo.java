package emall.web.component.admin.profile;

import emall.aop.annotation.CheckAdminName;
import emall.aop.annotation.CheckUsername;
import emall.entity.Admin;
import emall.service.admin.profile.InfoService;
import emall.util.string.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by taurinzeng on 2015/12/18.
 */
@Component
@RequestMapping("/admin")
public class UpdateInfo {
    @Autowired
    private InfoService infoService;

    @RequestMapping("/update/password")
    @CheckAdminName
    public ModelAndView UpdatePassword(Admin admin) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/profile/updatePassword");
        if("".equals(admin.getPassword())) {
            return modelAndView;
        }else {
            int result = infoService.updatePassword(admin);
            if(result == 1) {
                modelAndView.addObject(Constants.UPDATE_SUCCESS_MESSAGE);
            }else {
                modelAndView.addObject(Constants.UPDATE_FAIL_MESSAGE);
            }
        }
        return modelAndView;
    }
}
