package emall.web.component.merchant.log;

import emall.entity.MerchantLog;
import emall.service.merchant.log.LogService;
import emall.util.string.constants.ErrorMessageConstant;
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
@RequestMapping("/log")
public class LogComponent {
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private LogService logService;

    @RequestMapping("/get")
    @ResponseBody
    public Map getLogs(String name, int page) {
        Map<String, Object> map = checkStatus();
        if (!(Boolean) map.get("success")) {
            return map;
        }
        Map tmpMap;
        if (name == null) {
            tmpMap = logService.getLog(page, PageSizeConstant.LOG_PAGE_SIZE);
        } else {
            tmpMap = logService.getLogByName(name, page, PageSizeConstant.LOG_PAGE_SIZE);
        }
        map.put("logArray", tmpMap.get("logList"));
        map.put("logCount", tmpMap.get("count"));
        map.put("totalPage", Math.ceil((float) (Integer.parseInt(tmpMap.get("count").toString()) / PageSizeConstant.LOG_PAGE_SIZE)));
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
