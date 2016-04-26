package emall.web.component.merchant.item;

import emall.entity.Category;
import emall.entity.Item;
import emall.entity.ItemPic;
import emall.service.merchant.item.ItemBaseService;
import emall.service.merchant.item.ItemPicService;
import emall.util.file.UploadFile;
import emall.util.string.constants.ErrorMessageConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taurin on 2016/4/13.
 */
@Component
@RequestMapping("/item")
public class ShowItemComponent {
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private ItemBaseService itemBaseService;

    @Autowired
    private ItemPicService itemPicService;

    @Autowired
    private  UploadFile uploadFile;

    @RequestMapping("/get")
    @ResponseBody
    public Map getItem(Category category, int page, int status) {
        Map<String, Object> itemMap = checkStatus();
        if (!(Boolean)itemMap.get("success")) {
            return itemMap;
        }
        List itemList = itemBaseService.getItemByCategory(category, page, status);
        itemMap.put("itemList", itemList);
        return itemMap;
    }

    @RequestMapping(value = "/add_pic/{itemId}", method = RequestMethod.POST)
    public String addItemPic(@PathVariable String itemId, @RequestParam MultipartFile file) {
        Object merchantName = request.getSession().getAttribute("merchantName");
        if (merchantName == null) {
            return "redirect:/merchant/signIn";
        }
        Item item = (Item) itemBaseService.getItemById(itemId).get(0);
        try {
            String savePicURL = uploadFile.uploadPic(request, file, item.getCategoryId());
            ItemPic itemPic = new ItemPic(itemId, savePicURL);
            if (itemPicService.addItemPic(itemPic, item.getItemName(), file.getContentType()) != 1) {
                return "redirect:/merchant/product/pic/" + itemId + "?success=false";
            }
            return "redirect:/merchant/product/pic/" + itemId + "?success=true";
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/merchant/product/pic/" + itemId + "?success=false";
        }
    }

    @RequestMapping("/get_pic/{itemId}")
    @ResponseBody
    public Map getItemPic(@PathVariable String itemId) {
        Map<String, Object> itemMap = checkStatus();
        if (!(Boolean)itemMap.get("success")) {
            return itemMap;
        }
        List picList = itemPicService.getItemPic(itemId);
        itemMap.put("itemPic", picList);
        return itemMap;
    }

    @RequestMapping("/delete_pic/{itemId}")
    @ResponseBody
    public Map deleteItemPic(@PathVariable String itemId, String picURL) {
        Map<String, Object> itemMap = checkStatus();
        if (!(Boolean)itemMap.get("success")) {
            return itemMap;
        }
        String itemName = itemBaseService.getItemNameById(itemId);
        if (itemPicService.deleteItemPic(new ItemPic(itemId, picURL), itemName) != 1) {
            itemMap.put("success", false);
            itemMap.put("errorMessage", ErrorMessageConstant.SYSTEM_ERROR);
        }
        return itemMap;
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
