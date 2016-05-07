package emall.web.component.store;

import emall.service.user.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taurin on 2016/4/30.
 */
@Component
@RequestMapping("/order")
public class OrderComponent {
    @Autowired
    OrderService orderService;

    @Autowired
    HttpServletRequest request;

    @RequestMapping("/all")
    public Map getUserOrder() {
        Map<String, Object> infoMap = checkUserStatus();
        if (!(Boolean)infoMap.get("success")) {
            return infoMap;
        }
        List orderArray = orderService.getUserOrder(infoMap.get("userId").toString());
        infoMap.put("orderArray", orderArray);
        return infoMap;
    }

    public Map<String, Object> checkUserStatus() {
        Object userId = request.getSession().getAttribute("userId");
        Map<String, Object> map = new HashMap<String, Object>();
        if (userId == null) {
            map.put("success", false);
            map.put("errorMessage", "no_login");
        } else {
            map.put("success", true);
            map.put("userId", userId.toString());
        }
        return map;
    }
}
