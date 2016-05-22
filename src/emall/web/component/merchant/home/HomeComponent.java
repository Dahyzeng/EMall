package emall.web.component.merchant.home;

import emall.service.merchant.statistic.StatisticServer;
import emall.util.string.constants.ErrorMessageConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by taurin on 2016/5/20.
 */
@Controller
@RequestMapping("/statistic")
public class HomeComponent {
    @Autowired
    private StatisticServer statisticServer;
    @Autowired
    private HttpServletRequest request;


    @RequestMapping("/total")
    @ResponseBody
    public Map getTotalData() {
        Map<String, Object> map = checkStatus();
        if (!(Boolean)map.get("success")) {
            return map;
        }
        map.put("statistic", statisticServer.getStatistic());
        map.put("orderCount", statisticServer.getStatisticByWeek());
        return map;
    }

    @RequestMapping("/order_count")
    @ResponseBody
    public Map getOrderByWeek() {
        Map<String, Object> map = checkStatus();
//        if (!(Boolean)map.get("success")) {
//            return map;
//        }
        map.put("orderOunt", statisticServer.getStatisticByWeek());
        return map;
    }

    public Map<String, Object> checkStatus() {
        Map<String, Object> categoryMap = new HashMap<String, Object>();
        categoryMap.put("success",true);
        Object merchantName = request.getSession().getAttribute("merchantName");
        if (merchantName == null) {
            categoryMap.put("success", false);
            categoryMap.put("errorMessage", ErrorMessageConstant.NO_LOGIN_ERROR);
        }
        return categoryMap;
    }
}
