package emall.web;

import emall.entity.Category;
import emall.entity.Merchant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by taurin on 2016/4/9.
 */
@Controller
@RequestMapping("/test")
public class Test {

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
}
