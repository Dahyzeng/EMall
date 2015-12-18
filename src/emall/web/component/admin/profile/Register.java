package emall.web.component.admin.profile;

import emall.aop.annotation.CheckUsername;
import emall.entity.Admin;
import emall.service.admin.profile.InfoService;
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
@RequestMapping("/admin")
public class Register {
    @Autowired
    private InfoService infoService;

    @RequestMapping("/addAdmin")
    @CheckUsername
    public ModelAndView addAdmin(@Valid Admin admin, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/addAdmin");
        if(bindingResult.hasErrors()) {
            return modelAndView;
        }else {
            int result = infoService.addAdminService(admin);
            if(result == 1) {
                modelAndView.addObject(Constants.ADD_ADMIN_SUCCESS_MESSAGE);
            }else {
                modelAndView.addObject(Constants.ADD_ADMIN_FAIL_MESSAGE);
            }
        }
        return modelAndView;
    }

    @RequestMapping(value = "/nameUsable", method = RequestMethod.GET)
    @ResponseBody
    public int checkAdminNameUsable(String adminName){
        if ("".equals(adminName)){
            return -1;
        }else {
            return infoService.adminNameMatchService(adminName);
        }
    }
}
