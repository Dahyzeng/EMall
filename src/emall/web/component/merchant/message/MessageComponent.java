package emall.web.component.merchant.message;

import emall.service.merchant.message.MessageService;
import emall.util.string.constants.ErrorMessageConstant;
import emall.util.string.constants.MerchantConstants;
import emall.util.string.constants.PageSizeConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taurin on 2016/5/8.
 */
@Component
@RequestMapping("/leave_message")
public class MessageComponent {
    @Autowired
    private MessageService messageService;
    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/get")
    @ResponseBody
    public Map getAllMessages(int status, int page) {
        Map<String, Object> map = checkStatus();
        if (!(Boolean) map.get("success")) {
            return map;
        }
        List messageList =  messageService.getMessage(status, page, PageSizeConstant.MESSAGE_PAGE_SIZE);
        map.put("messages", messageList);
        return map;
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Map messageDetail(int id) {
        Map<String, Object> map = checkStatus();
        if (!(Boolean) map.get("success")) {
            return map;
        }
        List list = messageService.getDetailMessage(id);
        map.put("message", list.get(0));
        return map;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Map deleteMessage(int id) {
        Map<String, Object> map = checkStatus();
        if (!(Boolean) map.get("success")) {
            return map;
        }
        messageService.deleteMessage(id);
        return map;
    }

    public Map<String, Object> checkStatus() {
        Map<String, Object> itemMap = new HashMap<String, Object>();
        itemMap.put("success",true);
        Object merchantName = request.getSession().getAttribute("merchantName");
        if (merchantName == null) {
            itemMap.put("success", false);
            itemMap.put("errorMessage", ErrorMessageConstant.NO_LOGIN_ERROR);
        }
        return itemMap;
    }
}
