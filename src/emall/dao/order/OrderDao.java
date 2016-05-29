package emall.dao.order;

import emall.entity.Order;
import emall.entity.OrderItem;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by taurin on 2016/4/29.
 */
@Repository
public class OrderDao {
    @Autowired
    SessionFactory sessionFactory;

    public List getOrderByStatus (int status, int page, int pageSize) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Order where status=? order by createTime desc");
        query.setInteger(0, status);
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);
        return query.list();
    }

    public int getFinishedOrderCount() {
        Query query = sessionFactory.getCurrentSession().createQuery("from Order where status=3");
        return query.list().size();
    }

    public int getStatusOrderCount(int status) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Order where status=?");
        query.setInteger(0, status);
        return query.list().size();
    }

    public int getAllOrderCount() {
        Query query = sessionFactory.getCurrentSession().createQuery("from Order");
        return query.list().size();
    }

    public List getAllOrder(int page, int pageSize) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Order order by createTime desc");
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);
        return query.list();
    }

    public List getUserOrder(int userId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Order where userId=? and status != 5");
        query.setInteger(0, userId);
        return query.list();
    }

    public void addItemInOrder(OrderItem orderItem) {
        sessionFactory.getCurrentSession().save(orderItem);
    }

    public List getItemInOrder(String orderId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from OrderItem where orderId=?");
        query.setString(0, orderId);
        return query.list();
    }
    public void addOrder(Order order) {
        sessionFactory.getCurrentSession().save(order);
    }
    public void updateOrderStatus (String orderId, int status, Timestamp modifyTime) {
        Query query = sessionFactory.getCurrentSession().createQuery("update Order set status=?, lastModifiedTime=? where orderId=?");
        query.setInteger(0, status);
        query.setTimestamp(1, modifyTime);
        query.setString(2, orderId);
        query.executeUpdate();
    }

    public void deleteOrder(String orderId) {
        Query query = sessionFactory.getCurrentSession().createQuery("delete Order where orderId=?");
        query.setString(0, orderId);
        query.executeUpdate();
    }

    public void deleteOrderItem(String orderId) {
        Query query = sessionFactory.getCurrentSession().createQuery("delete OrderItem where orderId=?");
        query.setString(0, orderId);
        query.executeUpdate();
    }

    public void updateOrderItemEvaluate(String orderId, int itemId) {
        Query query = sessionFactory.getCurrentSession().createQuery("update OrderItem set evaluated=1 where orderId=? and itemId=?");
        query.setString(0, orderId);
        query.setInteger(1, itemId);
        query.executeUpdate();
    }

    public List getOrderItem(String orderId, int itemId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from OrderItem where orderId=? and itemId=?");
        query.setString(0, orderId);
        query.setInteger(1, itemId);
        return query.list();
    }
}
