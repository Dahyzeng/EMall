package emall.dao.profile.user;

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

    public List getUserOrder(int userId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Order where userId=?");
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
}
