package emall.service.user.review;

import emall.dao.order.EvaluateDao;
import emall.dao.order.OrderDao;
import emall.entity.ItemEvaluate;
import emall.util.string.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by taurin on 2016/5/29.
 */
@Service
public class ReviewService {
    @Autowired
    private EvaluateDao evaluateDao;
    @Autowired
    private OrderDao orderDao;

    @Transactional(rollbackFor = Exception.class)
    public int addEvaluate(ItemEvaluate itemEvaluate, String orderId) {
        SimpleDateFormat toDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp date = Timestamp.valueOf(toDateTime.format(new Date().getTime()));
        itemEvaluate.setDate(date);
        evaluateDao.addEvaluate(itemEvaluate);
        orderDao.updateOrderItemEvaluate(orderId, itemEvaluate.getItemId());
        return Constants.SUCCESS_NUMBER;
    }

    public List getItemEvaluate(int itemId) {
        return evaluateDao.getItemEvaluate(itemId);
    }

}
