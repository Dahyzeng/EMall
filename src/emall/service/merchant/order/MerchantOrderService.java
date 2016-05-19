package emall.service.merchant.order;

import emall.dao.order.OrderDao;
import emall.util.string.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by taurin on 2016/5/18.
 */
@Service
public class MerchantOrderService {
    @Autowired
    private OrderDao orderDao;

    public List getAllOrder(int page, int pageSize) {
        return orderDao.getAllOrder(page, pageSize);
    }

    public List getOrderByStatus(int status, int page, int pageSize) {
        return orderDao.getOrderByStatus(status, page, pageSize);
    }

    public int getFinishedOrderCount() {
        return orderDao.getFinishedOrderCount();
    }

    public int getStatusOrderCount(int status) {
        return orderDao.getStatusOrderCount(status);
    }

    public int getAllOrderCount() {
        return orderDao.getAllOrderCount();
    }

    @Transactional(rollbackFor = Exception.class)
    public int updateOrderStatus(String orderId, int status) {
        SimpleDateFormat toDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp date = Timestamp.valueOf(toDateTime.format(new Date().getTime()));
        orderDao.updateOrderStatus(orderId, status, date);
        return Constants.SUCCESS_NUMBER;
    }
}