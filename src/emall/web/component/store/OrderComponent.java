package emall.web.component.store;

import emall.entity.Address;
import emall.entity.Item;
import emall.entity.Order;
import emall.entity.OrderItem;
import emall.service.merchant.item.ItemBaseService;
import emall.service.user.address.AddressService;
import emall.service.user.cart.CartService;
import emall.service.user.order.OrderService;
import emall.util.DwrScriptSessionManagerUtil;
import emall.util.EmailSender;
import emall.util.string.IdGeneral;
import emall.util.string.constants.EmailConstant;
import emall.util.string.constants.MapConstant;
import net.sf.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by taurin on 2016/4/30.
 */
@Component
@RequestMapping("/order")
public class OrderComponent {
    @Autowired
    private OrderService orderService;
    @Autowired
    private ItemBaseService itemBaseService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/all")
    @ResponseBody
    public Map getUserOrder() {
        Map<String, Object> infoMap = checkUserStatus();
        List<Map> orderList = new ArrayList<Map>();
        if (!(Boolean)infoMap.get("success")) {
            return infoMap;
        }
        List orderArray = orderService.getUserOrder(Integer.parseInt(infoMap.get("userId").toString()));
        for (Object tmp : orderArray) {
            Map<String, Object> orderMap = new HashMap<String, Object>();
            List<Object> itemArray = new ArrayList<Object>();
            Order order = (Order) tmp;
            Address address = addressService.getAddressById(order.getAddressId());
            List itemList = orderService.getItem(order.getOrderId());
            for (Object itemTmp : itemList) {
                Map<String, Object> itemMap = new HashMap<String, Object>();
                OrderItem orderItem = (OrderItem) itemTmp;
                Item item = (Item) itemBaseService.getItemById(orderItem.getItemId()).get(0);
                item.setDescription("");
                itemMap.put("item", item);
                itemMap.put("quantity", orderItem.getQuantity());
                itemMap.put("unitCost", orderItem.getUnitCost());
                itemMap.put("evaluated", orderItem.getEvaluated());
                itemArray.add(itemMap);
            }
            orderMap.put("orderId", order.getOrderId());
            orderMap.put("address", address);
            orderMap.put("items", itemArray);
            String createTime = order.getCreateTime().toString();
            orderMap.put("createTime", createTime.substring(0, createTime.length() - 2));
            orderMap.put("totalPrice", order.getTotalPrice());
            orderMap.put("status", MapConstant.ORDER_STATUS_MAP.get(order.getStatus()));
            orderMap.put("expressInfo", orderService.getExpressInfo(order.getOrderId()));
            orderList.add(orderMap);
        }
        infoMap.put("orderArray", orderList);
        return infoMap;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Map deleteOrder(String orderId) {
        Map<String, Object> infoMap = checkUserStatus();
        if (!(Boolean)infoMap.get("success")) {
            return infoMap;
        }
        if (orderService.updateOrderStatus(orderId, 5) != 1) {
            infoMap.put("success", false);
        }
        return infoMap;
    }

    @RequestMapping("/update")
    @ResponseBody
    public Map changeOrderStatus (String orderId, int status) {
        Map<String, Object> infoMap = checkUserStatus();
        if (!(Boolean)infoMap.get("success")) {
            return infoMap;
        }
        if (orderService.updateOrderStatus(orderId, status) != 1) {
            infoMap.put("success", false);
        }
        return infoMap;
    }

    @RequestMapping("/items")
    @ResponseBody
    public Map choseItems(String items) {
        Map<String, Object> infoMap = checkUserStatus();
        if (!(Boolean)infoMap.get("success")) {
            return infoMap;
        }
        infoMap.put("items", items);
        infoMap.put("checkoutStep", 1);
        request.getSession().setAttribute("items", items);
        request.getSession().setAttribute("checkoutStep", 1);
        return infoMap;
    }

    @RequestMapping("/confirm")
    @ResponseBody
    public Map confirmOrder(String addressJson, String payMethod) {
        Map<String, Object> infoMap = checkUserStatus();
        if (!(Boolean)infoMap.get("success")) {
            return infoMap;
        }
        request.getSession().setAttribute("address", addressJson);
        request.getSession().setAttribute("payMethod", payMethod);
        request.getSession().setAttribute("checkoutStep", 2);
        return infoMap;
    }

    @RequestMapping("/place")
    @ResponseBody
    public Map placeOrder () throws JSONException {
        Map<String, Object> orderMap = checkUserStatus();
        if (!(Boolean)orderMap.get("success")) {
            return orderMap;
        }
        HttpSession session = request.getSession();
        if (session.getAttribute("checkoutStep") == null) {
            orderMap.put("success", false);
            orderMap.put("errorMessage", "Your have placed this order, please don't place it again");
            return orderMap;
        }
        List<Map> itemList = new ArrayList<Map>();

        int userId = Integer.parseInt(session.getAttribute("userId").toString());
        String orderId = IdGeneral.primaryKey();
        String addressJson = session.getAttribute("address").toString();
        String payMethod = session.getAttribute("payMethod").toString();
        String itemsJson = session.getAttribute("items").toString();
        JSONObject address = new JSONObject(addressJson);
        int addressId = Integer.parseInt(address.get("addressId").toString());
        JSONArray items = JSONArray.fromObject(itemsJson);
        float totalPrice = 0;
        for (int i = 0; i < items.size(); i++) {
            Map<String, Object> map = new HashMap<String, Object>();
            net.sf.json.JSONObject item = items.getJSONObject(i);
            int quantity =  Integer.parseInt(item.get("quantity").toString());
            net.sf.json.JSONObject itemBean = ( net.sf.json.JSONObject) item.get("item");
            int itemId = Integer.parseInt(itemBean.get("itemId").toString());
            float price = Float.parseFloat(itemBean.get("price").toString());
            float discount = Float.parseFloat(itemBean.get("discount").toString());
            map.put("quantity", quantity);
            map.put("itemId", itemId);
            map.put("unitCost", price - discount);
            itemList.add(map);
            totalPrice = totalPrice + quantity * (Float.parseFloat(itemBean.get("price").toString()) - Float.parseFloat(itemBean.get("discount").toString()));
        }

        Order order = new Order(userId, addressId, payMethod, totalPrice, orderId);
        if (payMethod.equals("Pay Online")) {
            order.setStatus(-2);
        }
        if (orderService.placeOrder(order, itemList) == 1) {
            String content = EmailConstant.ORDER_MAIL_CONTENT.replace("%username%", address.get("consignee").toString());
            new EmailSender().sendEmail(address.get("email").toString(), EmailConstant.ORDER_MAIL_SUBJECT, content.replace("%orderId%", orderId));
        } else {
            orderMap.put("success", false);
        }
        orderMap.put("payMethod", payMethod);
        orderMap.put("orderId", orderId);
        session.removeAttribute("checkoutStep");
        session.removeAttribute("items");
        if (payMethod.equals("Pay On Delivery")){
            Object newOrder = request.getServletContext().getAttribute("newOrder");
            if (newOrder == null) {
                request.getServletContext().setAttribute("newOrder", 1);
                DwrScriptSessionManagerUtil.sendMessageAuto(1);
            } else {
                int count = Integer.parseInt(newOrder.toString());
                request.getServletContext().setAttribute("newOrder", ++count);
                DwrScriptSessionManagerUtil.sendMessageAuto(count);
            }
        }
        return orderMap;
    }

    @RequestMapping("/flow_data")
    @ResponseBody
    public Map checkoutFlowData() {
        Map<String, Object> infoMap = checkUserStatus();
        if (!(Boolean)infoMap.get("success")) {
            return infoMap;
        }
        HttpSession session = request.getSession();
        infoMap.put("items", session.getAttribute("items"));
        infoMap.put("checkoutStep", session.getAttribute("checkoutStep"));
        infoMap.put("address", session.getAttribute("address"));
        infoMap.put("payMethod", session.getAttribute("payMethod"));
        return infoMap;
    }


    public Map<String, Object> checkUserStatus() {
        Object userId = request.getSession().getAttribute("userId");
        Map<String, Object> map = new HashMap<String, Object>();
        if (userId == null) {
            map.put("success", false);
            map.put("errorMessage", "no_login");
        } else {
            map.put("success", true);
            map.put("userId", userId.toString());
        }
        return map;
    }
}
