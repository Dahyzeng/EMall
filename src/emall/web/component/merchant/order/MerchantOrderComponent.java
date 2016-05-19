package emall.web.component.merchant.order;

import emall.entity.Address;
import emall.entity.Item;
import emall.entity.Order;
import emall.entity.OrderItem;
import emall.service.merchant.item.ItemBaseService;
import emall.service.merchant.order.MerchantOrderService;
import emall.service.user.address.AddressService;
import emall.service.user.order.OrderService;
import emall.util.string.constants.ErrorMessageConstant;
import emall.util.string.constants.MapConstant;
import emall.util.string.constants.PageSizeConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taurin on 2016/5/18.
 */
@Component
@RequestMapping("/merchant/order")
public class MerchantOrderComponent {
    @Autowired
    private MerchantOrderService merchantOrderService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private AddressService addressService;
    @Autowired
    private ItemBaseService itemBaseService;

    @RequestMapping("/by_status")
    @ResponseBody
    public Map getAllOrder(int page, String status) {
        Map<String, Object> map = checkStatus();
        if (!(Boolean) map.get("success")) {
            return map;
        }
        List<Map> orderList = new ArrayList<Map>();
        List orderArray;
        int count;
        if (status == null) {
            orderArray = merchantOrderService.getAllOrder(page, PageSizeConstant.BACKEND_ORDER_PAGE_SIZE);
            count = merchantOrderService.getAllOrderCount();
        } else {
            orderArray = merchantOrderService.getOrderByStatus(Integer.parseInt(status), page, PageSizeConstant.BACKEND_ORDER_PAGE_SIZE);
            count = merchantOrderService.getStatusOrderCount(Integer.parseInt(status));
        }

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
                itemMap.put("item", item);
                itemMap.put("quantity", orderItem.getQuantity());
                itemMap.put("unitCost", orderItem.getUnitCost());
                itemArray.add(itemMap);
            }
            orderMap.put("orderId", order.getOrderId());
            orderMap.put("address", address);
            orderMap.put("items", itemArray);
            orderMap.put("payMethod", order.getPayMethod());
            String createTime = order.getCreateTime().toString();
            orderMap.put("createTime", createTime.substring(0, createTime.length() - 2));
            orderMap.put("totalPrice", order.getTotalPrice());
            orderMap.put("status", MapConstant.ORDER_STATUS_MAP.get(order.getStatus()));
            orderList.add(orderMap);
        }

        map.put("orderArray", orderList);
        map.put("count", count);
        map.put("pageSize", PageSizeConstant.BACKEND_ORDER_PAGE_SIZE);
        return map;
    }

    public Map<String, Object> checkStatus() {
        Map<String, Object> itemMap = new HashMap<String, Object>();
        itemMap.put("success",true);
        Object merchantName = request.getSession().getAttribute("merchantName");
        if (merchantName == null) {
            itemMap.put("success", false);
            itemMap.put("errorMessage", ErrorMessageConstant.NO_LOGIN_ERROR);
        }
        return itemMap;
    }
}
