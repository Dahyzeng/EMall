package emall.web.component.merchant.item;

import emall.entity.Item;
import emall.entity.PromotionItem;
import emall.service.merchant.category.CategoryService;
import emall.service.merchant.item.ItemBaseService;
import emall.util.file.UploadFile;
import emall.util.string.constants.ErrorMessageConstant;
import emall.util.string.constants.SuccessMessageConstant;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taurin on 2016/4/11.
 */
@Controller
@RequestMapping("/item")
public class ItemComponent {
    @Autowired
    private ItemBaseService itemBaseService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    UploadFile uploadFile;

    @Autowired
    private HttpServletRequest request;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ModelAndView addItem(Item item,  @RequestParam MultipartFile file, float discount) {
        ModelAndView mav = checkStatus();
        if (!(Boolean)mav.getModelMap().get("success")) {
            mav.setViewName("redirect:/merchant/signIn");
            return mav;
        }
        if (file.getSize() != 0) {
            try {
                String savePicURL = uploadFile.uploadPic(request, file, item.getCategoryId());
                item.setShowPicURL(savePicURL);

            } catch (Exception e) {
                e.printStackTrace();
                mav.addObject("success", false);
                mav.addObject("errorMessage", ErrorMessageConstant.ADD_ITEM_ERROR);
                mav.setViewName("/backend/product_edit");
                return mav;
            }
        }
        mav.addObject("operationSuccess", true);
        if (!item.getItemId().equals("")) {
            if (discount != 0) {
                item.setDiscount(discount);
                itemBaseService.updateItemDiscount(item);
                itemBaseService.updateDiscount(new PromotionItem(item.getItemId(), discount, item.getPrice()), item.getItemName());
            }
            if (itemBaseService.updateItem(item) == 1) {
                mav.setViewName("redirect:/merchant/product");
            }
        } else {
            item.setItemId(null);
            if (itemBaseService.addItem(item) == 1) {
                mav.setViewName("redirect:/merchant/product");
            }
        }
        return mav;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map deleteItem(Item item) {
        Map<String, Object> messageMap = new HashMap<String, Object>();
        Object merchantName = request.getSession().getAttribute("merchantName");
        messageMap.put("success", false);
        if (merchantName == null) {
            messageMap.put("errorMessage", ErrorMessageConstant.NO_LOGIN_ERROR);
            return messageMap;
        }
        if (itemBaseService.deleteItem(item) == 1) {
            messageMap.put("success", true);
        } else {
            messageMap.put("errorMessage", ErrorMessageConstant.SYSTEM_ERROR);
        }
        return messageMap;
    }

    @RequestMapping("/edit/{itemId}")
    public ModelAndView itemEdit(@PathVariable String itemId) {
        ModelAndView mav = checkStatus();
        if (!(Boolean)mav.getModelMap().get("success")) {
            mav.setViewName("redirect:/merchant/signIn");
            return mav;
        }
        List tmpList = itemBaseService.getItemById(itemId);
        if (tmpList.size() != 0) {
            List discount = itemBaseService.getDiscount(itemId);
            if (discount.size() != 0) {
                PromotionItem promotionItem = (PromotionItem)discount.get(0);
                mav.addObject("discount", promotionItem.getDiscount());
            }
            mav.addObject("item", tmpList.get(0));

            mav.addObject("operationMessage", "Edit Item");
        }
        mav.setViewName("/backend/product_edit");
        return mav;
    }

    @RequestMapping("/status")
    @ResponseBody
    public Map changeItemStatus(Item item) {
        Map<String, Object> messageMap = new HashMap<String, Object>();
        Object merchantName = request.getSession().getAttribute("merchantName");
        messageMap.put("success", false);
        if (merchantName == null) {
            messageMap.put("errorMessage", ErrorMessageConstant.NO_LOGIN_ERROR);
            return messageMap;
        }
        if (itemBaseService.changeItemStatus(item) == 1) {
            messageMap.put("success", true);
        } else {
            messageMap.put("errorMessage", ErrorMessageConstant.SYSTEM_ERROR);
        }
        return messageMap;
    }

    public ModelAndView checkStatus() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("success", true);
        Object merchantName = request.getSession().getAttribute("merchantName");
        if (merchantName == null) {
            mav.addObject("success", false);
            mav.addObject("errorMessage", ErrorMessageConstant.NO_LOGIN_ERROR);
        }
        return mav;
    }

    public void setItemBaseService(ItemBaseService itemBaseService) {
        this.itemBaseService = itemBaseService;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }
}
