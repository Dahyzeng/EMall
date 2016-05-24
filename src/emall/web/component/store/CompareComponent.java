package emall.web.component.store;

import emall.entity.Item;
import emall.service.merchant.item.ItemBaseService;
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
 * Created by taurin on 2016/5/4.
 */
@Component
@RequestMapping("/compare")
public class CompareComponent {

    @Autowired
    private HttpServletRequest request;
    @Autowired
    private ItemBaseService itemBaseService;

    @RequestMapping("/add")
    @ResponseBody
    public Map addCompareItem(int itemId) {
        Map<String, Object> map = new HashMap<String, Object>();
        List<Integer> itemList;
        Object tmp = request.getSession().getAttribute("compareItemList");
        if (tmp != null) {
            itemList = (List) tmp;
            if (itemList.size() < 3) {
                if (!itemList.contains(itemId)) {
                    itemList.add(itemId);
                }
            } else {
                map.put("success", false);
                map.put("errorMessage", "Can't add more than 3 items to compare");
                return map;
            }

        } else {
            itemList = new ArrayList<Integer>();
            itemList.add(itemId);
        }
        request.getSession().setAttribute("compareItemList", itemList);
        map.put("success", true);
        return map;
    }

    @RequestMapping("/get")
    @ResponseBody
    public List getCompareItem() {
        List<Item> itemList = new ArrayList<Item>();
        Object tmp = request.getSession().getAttribute("compareItemList");
        if (tmp != null) {
            List<Integer> compareList = (List<Integer>) tmp;
            for (int itemId : compareList) {
                itemList.add((Item) itemBaseService.getItemById(itemId).get(0));
            }
        }
        return itemList;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Map deleteCompareItem(int itemId) {
        Map<String, Object> map = new HashMap<String, Object>();
        List<Integer> itemList;
        Object tmp = request.getSession().getAttribute("compareItemList");
        if (tmp != null) {
            itemList = (List) tmp;
            itemList.remove(((Integer)itemId));
        }
        map.put("success", true);
        return map;
    }
}
