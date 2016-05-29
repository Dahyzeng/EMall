package emall.service.user.order;

import emall.dao.item.ItemBaseDao;
import emall.dao.order.EvaluateDao;
import emall.dao.order.ExpressInfoDao;
import emall.dao.profile.user.CartDao;
import emall.dao.order.OrderDao;
import emall.dao.profile.user.UserLogDao;
import emall.dao.statistic.StatisticDao;
import emall.entity.*;
import emall.util.string.Constants;
import org.hibernate.SessionFactory;
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
    @Autowired
    private ItemBaseDao itemBaseDao;
    @Autowired
    private ExpressInfoDao expressInfoDao;
    @Autowired
    private StatisticDao statisticDao;
    @Autowired
    private EvaluateDao evaluateDao;

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
        statisticDao.updateTotalPrice(order.getTotalPrice());
        for (int i = 0; i < itemList.size(); i++) {
            Map map = (Map) itemList.get(i);
            int quantity = Integer.parseInt(map.get("quantity").toString());
            int itemId = Integer.parseInt(map.get("itemId").toString());
            float unitCost = Float.parseFloat(map.get("unitCost").toString());
            itemBaseDao.updateItemInventory(itemId, -quantity);
            itemBaseDao.updateSaleQuantity(itemId, quantity);
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

        if (status == -1) {
            float price = 0;
            List itemList = orderDao.getItemInOrder(orderId);
            for (Object tmp : itemList) {
                OrderItem item = (OrderItem) tmp;
                itemBaseDao.updateSaleQuantity(item.getItemId(), -item.getQuantity());
                itemBaseDao.updateItemInventory(item.getItemId(), item.getQuantity());
                price = price + item.getUnitCost() * item.getQuantity();
            }
            statisticDao.updateTotalPrice(-price);
        }

        if (status == 3) {
            statisticDao.updateFinishedOrder();
        }

        return Constants.SUCCESS_NUMBER;
    }

    public List getOrderItem(String orderId, int itemId) {
        return orderDao.getOrderItem(orderId, itemId);
    }

    public ExpressInfo getExpressInfo(String orderId) {
        List list = expressInfoDao.getExpressInfo(orderId);
        if (list.size() == 0) {
            return null;
        } else
        return (ExpressInfo) list.get(0);
    }

    public UserLog getUserLog(Timestamp date) {
        UserLog log = new UserLog();
        log.setUsername(request.getSession().getAttribute("email").toString());
        log.setOperationDate(date);
        return log;
    }
}
