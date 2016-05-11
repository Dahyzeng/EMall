package emall.web.component.store;

import emall.entity.LeaveMessage;
import emall.service.user.message.LeaveMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by taurin on 2016/5/8.
 */
@Component
@RequestMapping("/message")
public class LeaveMessageComponent {
    @Autowired
    private LeaveMessageService leaveMessageService;

    @RequestMapping("/add")
    @ResponseBody
    public Map addMessage(LeaveMessage leaveMessage) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (leaveMessageService.addMessage(leaveMessage) == 1) {
            map.put("success", true);
        }
        return map;
    }
}
