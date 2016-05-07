package emall.service.user.cart;

import emall.dao.item.ItemBaseDao;
import emall.dao.profile.user.CartDao;
import emall.entity.Cart;
import emall.util.string.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by taurin on 2016/4/19.
 */
@Service
public class CartService {
    @Autowired
    private CartDao cartDao;

    @Autowired
    private ItemBaseDao itemBaseDao;

    @Transactional(rollbackFor = Exception.class)
    public int addToCart(Cart cart) {
        List list = cartDao.matchItemInCart(cart);
        if (list.size() == 0) {
            cartDao.addToCart(cart);
        } else {
            Cart cart1 = (Cart) list.get(0);
            cart.setQuantity(cart.getQuantity() + cart1.getQuantity());
            cartDao.updateQuantity(cart);
        }
        return Constants.SUCCESS_NUMBER;
    }

    @Transactional(rollbackFor = Exception.class)
    public int updateCartItem(Cart cart) {
        cartDao.addToCart(cart);
        return Constants.SUCCESS_NUMBER;
    }

    @Transactional(rollbackFor = Exception.class)
    public int deleteItemFromCart(String userId, String ...itemId) {
        StringBuilder stringBuilder = new StringBuilder();
        if (itemId.length > 0) {
            for (int i = 0; i < itemId.length; i++) {
                stringBuilder.append("'");
                stringBuilder.append(itemId[i]);
                stringBuilder.append("',");
            }
            stringBuilder.deleteCharAt(stringBuilder.length() - 1);
            cartDao.deleteItemFromCart(stringBuilder.toString(), userId);
            return Constants.SUCCESS_NUMBER;
        } else {
            return Constants.FAIL_NUMBER;
        }
    }

    public List getAllItemFromCart(String useId) {
        return cartDao.getAllItemInCart(useId);
    }

    public int getItemInventory(String itemId) {
        List list = itemBaseDao.getItemInventory(itemId);
        if (list.size() == 0) {
            return 0;
        } else {
            return Integer.parseInt(list.get(0).toString());
        }
    }
}
