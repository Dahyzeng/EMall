package emall.dao.profile.user;

import emall.entity.Cart;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by taurin on 2016/4/19.
 */
@Repository
public class CartDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void addToCart(Cart cart) {
        sessionFactory.getCurrentSession().saveOrUpdate(cart);
    }

    public void updateQuantity(Cart cart) {
        Query query = sessionFactory.getCurrentSession().createQuery("update Cart set quantity=? where userId=? and itemId=?");
        query.setInteger(0, cart.getQuantity());
        query.setInteger(1, cart.getUserId());
        query.setInteger(2, cart.getItemId());
        query.executeUpdate();
    }

    public List matchItemInCart(Cart cart) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Cart where userId=? and itemId=?");
        query.setInteger(0, cart.getUserId());
        query.setInteger(1, cart.getItemId());
        return query.list();
    }

    public List getAllItemInCart(int userId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Cart where userId=?");
        query.setInteger(0, userId);
        return query.list();
    }

    public void deleteItemFromCart(String itemIds, int userId) {
        Query query = sessionFactory.getCurrentSession().createQuery("delete Cart where userId=? and itemId in (" + itemIds + ")" );
        query.setInteger(0, userId);
        query.executeUpdate();
    }

    public void orderDeleteItem(int itemId, int userId) {
        Query query = sessionFactory.getCurrentSession().createQuery("delete Cart where userId=? and itemId=?");
        query.setInteger(0, userId);
        query.setInteger(1, itemId);
        query.executeUpdate();
    }
}
