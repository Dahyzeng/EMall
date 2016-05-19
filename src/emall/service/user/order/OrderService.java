package emall.service.user.order;

import emall.dao.profile.user.CartDao;
import emall.dao.order.OrderDao;
import emall.dao.profile.user.UserLogDao;
import emall.entity.Order;
import emall.entity.OrderItem;
import emall.entity.UserLog;
import emall.util.string.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by taurin on 2016/4/29.
 */
@Service
public class OrderService {
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private UserLogDao userLogDao;
    @Autowired
    private CartDao cartDao;

    public List getUserOrder(int userId) {
        return orderDao.getUserOrder(userId);
    }

    @Transactional(rollbackFor = Exception.class)
    public int deleteOrder(String orderId) {
        orderDao.deleteOrderItem(orderId);
        orderDao.deleteOrder(orderId);
        SimpleDateFormat toDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp date = Timestamp.valueOf(toDateTime.format(new Date().getTime()));
        UserLog userLog = getUserLog(date);
        userLog.setOperation("delete order: " + orderId);
        userLogDao.addLog(userLog);
        return Constants.SUCCESS_NUMBER;
    }

    public List getItem(String orderId) {
        return orderDao.getItemInOrder(orderId);
    }
    @Transactional(rollbackFor = Exception.class)
    public int placeOrder(Order order, List itemList) {
        SimpleDateFormat toDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp date = Timestamp.valueOf(toDateTime.format(new Date().getTime()));
        order.setCreateTime(date);
        order.setLastModifiedTime(date);
        orderDao.addOrder(order);
        for (int i = 0; i < itemList.size(); i++) {
            Map map = (Map) itemList.get(i);
            int quantity = Integer.parseInt(map.get("quantity").toString());
            int itemId = Integer.parseInt(map.get("itemId").toString());
            float unitCost = Float.parseFloat(map.get("unitCost").toString());
            orderDao.addItemInOrder(new OrderItem(order.getOrderId(), itemId, quantity, unitCost));
            cartDao.orderDeleteItem(itemId, order.getUserId());
        }
        UserLog userLog = getUserLog(date);
        userLog.setOperation("create an order, order id is " + order.getOrderId());
        userLogDao.addLog(userLog);
        return Constants.SUCCESS_NUMBER;
    }

    @Transactional(rollbackFor = Exception.class)
    public int updateOrderStatus(String orderId, int status) {
        SimpleDateFormat toDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp date = Timestamp.valueOf(toDateTime.format(new Date().getTime()));
        orderDao.updateOrderStatus(orderId, status, date);
        return Constants.SUCCESS_NUMBER;
    }

    public UserLog getUserLog(Timestamp date) {
        UserLog log = new UserLog();
        log.setUsername(request.getSession().getAttribute("email").toString());
        log.setOperationDate(date);
        return log;
    }
}
