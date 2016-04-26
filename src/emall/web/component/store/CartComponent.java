package emall.web.component.store;

import emall.dao.item.ItemBaseDao;
import emall.entity.Cart;
import emall.entity.Item;
import emall.service.user.cart.CartService;
import emall.util.string.constants.ErrorMessageConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taurin on 2016/4/20.
 */
@Controller
public class CartComponent {
    @Autowired
    private CartService cartService;

    @Autowired
    private ItemBaseDao itemBaseDao;

    @Autowired
    HttpServletRequest request;

    @RequestMapping("/cart/add")
    @ResponseBody
    public Map addToCart(String itemId, int quantity) {
        Map<String, Object> map = checkUsername();
        if (!(Boolean) map.get("success")) {
            return map;
        }
        String userId = (String) request.getSession().getAttribute("userId");
        if (cartService.addToCart(new Cart(userId, itemId, quantity)) != 1) {
            map.put("success", false);
            map.put("errorMessage", ErrorMessageConstant.SYSTEM_ERROR);
        }
        return map;
    }

    @RequestMapping("/cart/getAll")
    @ResponseBody
    public Map getCartItem() {
        Map<String, Object> map = new HashMap<String, Object>();
        Object username = request.getSession().getAttribute("username");
        if (username == null) {
            map.put("success", false);
            return map;
        }
        float totalPrice = 0;
        List<Map> itemList = new ArrayList<Map>();
        String userId = (String) request.getSession().getAttribute("userId");
        List list = cartService.getAllItemFromCart(userId);
        if (list.size()  != 0) {
            for (Object tmp : list) {
                Map<String, Object> itemMap = new HashMap<String, Object>();
                Cart cart = (Cart) tmp;
                Item item = (Item) itemBaseDao.getItemById(cart.getItemId()).get(0);
                item.setPrice(item.getPrice() - item.getDiscount());
                totalPrice += item.getPrice() * cart.getQuantity();
                itemMap.put("item", item);
                itemMap.put("quantity", cart.getQuantity());
                itemList.add(itemMap);
            }
        }
        map.put("itemList", itemList);
        map.put("totalPrice", totalPrice);
        map.put("success", true);
        return map;
    }
    public Map<String, Object> checkUsername() {
        Map<String, Object> map = new HashMap<String, Object>();
        Object username = request.getSession().getAttribute("username");
        if (username == null) {
            String url = request.getHeader("referer");
            if (url != null) {
                url = url.substring(21);
                try {
                    url = URLEncoder.encode(url, "UTF-8");
                    map.put("url", url);
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }

            map.put("success", false);
            map.put("errorMessage", "no_login");
        } else {
            map.put("success", true);
        }
        return map;
    }

}
