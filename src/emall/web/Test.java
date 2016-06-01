package emall.web;

import emall.entity.Category;
import emall.entity.Merchant;
import emall.util.DwrScriptSessionManagerUtil;
import emall.util.EmailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by taurin on 2016/4/9.
 */
@Controller
@RequestMapping("/test")
public class Test {

    @Autowired
    HttpServletRequest request;
    @RequestMapping("/json_test")
    @ResponseBody
    public List testJson() {
        List list = new ArrayList();
        list.add(new Merchant("ee", "fff"));
        list.add(new Merchant("aa", "gg"));
        list.add(new Merchant("bb", "ffeef"));
        list.add(new Merchant("cc", "hh"));
        list.add(new Merchant("dd", "ffaaaf"));
        return list;
    }

    @RequestMapping("/string_to_object")
    public void stringToObject(Category category) {
        System.out.print("get in  "+category.toString());
    }

    @RequestMapping("/mailSend")

    public void emailSend() {
        new EmailSender().sendEmail("734711226@qq.com", "test email sender", "if u see this mail, it means success");
    }

    @RequestMapping("/order")
    @ResponseBody
    public void testMessage() {
        Object newOrder = request.getServletContext().getAttribute("newOrder");
        if (newOrder == null) {
            request.getServletContext().setAttribute("newOrder", 1);
            DwrScriptSessionManagerUtil.sendMessageAuto(1);
        } else {
            int count = Integer.parseInt(newOrder.toString());
            request.getServletContext().setAttribute("newOrder", ++count);
            DwrScriptSessionManagerUtil.sendMessageAuto(count);
        }


    }
}
