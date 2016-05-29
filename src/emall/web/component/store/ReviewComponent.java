package emall.web.component.store;

import emall.entity.ItemEvaluate;
import emall.service.user.review.ReviewService;
import emall.util.string.constants.ErrorMessageConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by taurin on 2016/5/29.
 */
@Component
@RequestMapping("/review")
public class ReviewComponent {
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/add")
    @ResponseBody
    public Map addReview(int priceRate, int qualityRate, String comment, int itemId, String orderId) {
        Map<String, Object> map = new HashMap<String, Object>();
        Object userId = request.getSession().getAttribute("userId");
        Object username = request.getSession().getAttribute("username");
        map.put("success", false);
        if (userId == null) {
            map.put("errorMessage", ErrorMessageConstant.NO_LOGIN_ERROR);
            return map;
        }
        if (reviewService.addEvaluate(new ItemEvaluate(itemId, qualityRate, priceRate, comment, Integer.parseInt(userId.toString()), username.toString()), orderId) == 1) {
            map.put("success", true);
        } else {
            map.put("errorMessage", ErrorMessageConstant.SYSTEM_ERROR);
        }
        return map;
    }

}
