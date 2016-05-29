package emall.web.component.store;

import emall.entity.Category;
import emall.entity.Item;
import emall.entity.ItemEvaluate;
import emall.service.merchant.item.ItemBaseService;
import emall.service.store.common.StoreCategoryService;
import emall.service.store.common.StoreItemService;
import emall.service.user.profile.ProfileService;
import emall.service.user.review.ReviewService;
import emall.util.string.constants.PageSizeConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taurin on 2016/4/17.
 */
@Controller
@RequestMapping("/store")
public class PageCommonComponent {
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private StoreCategoryService storeCategoryService;
    @Autowired
    private StoreItemService storeItemService;
    @Autowired
    private ItemBaseService itemBaseService;
    @Autowired
    private ReviewService  reviewService;
    @Autowired
    private ProfileService profileService;

    @RequestMapping("/get_categories")
    @ResponseBody
    public List getCategory() {
        List<Map> categoryList = new ArrayList<Map>();
        List fatherCategoryList = storeCategoryService.getFatherCategory();
        for (Object tmp : fatherCategoryList) {
            Map<String, Object> categoryMap = new HashMap<String, Object>();
            if (tmp != null) {
                Category category = (Category) tmp;
                List childCategoryList = storeCategoryService.getChildCategory(category.getCategoryId());
                categoryMap.put("fatherCategoryName", category.getCategoryName());
                categoryMap.put("childCategory", childCategoryList);
                categoryMap.put("categoryId", category.getCategoryId());
                categoryList.add(categoryMap);
            }
        }
        return categoryList;
    }

    @RequestMapping("/get_item_category")
    @ResponseBody
    public List getItemByCategory(Category category, int page, String pageType, String sortValue) {
        List list;
        if ("undefined".equals(sortValue)) {
            sortValue = null;
        }
        if ("grid".equals(pageType)) {
            Object pageSize = request.getSession().getAttribute("gridPageSize");
            if (pageSize == null) {
                list = storeItemService.getItemByCategory(category, page, 1, PageSizeConstant.GRID_PAGE_SIZE, sortValue);
            } else  {
                list = storeItemService.getItemByCategory(category, page, 1, Integer.parseInt(pageSize.toString()), sortValue);
            }
        } else  {
            Object pageSize = request.getSession().getAttribute("listPageSize");
            if (pageSize == null) {
                list = storeItemService.getItemByCategory(category, page, 1, PageSizeConstant.GRID_PAGE_SIZE, sortValue);
            } else {
                list = storeItemService.getItemByCategory(category, page, 1, Integer.parseInt(pageSize.toString()), sortValue);
            }
        }
        return list;
    }

    @RequestMapping("/get_item_id/{itemId}")
    @ResponseBody
    public Map getItemById(@PathVariable int itemId) {
        List itemList = storeItemService.getItemById(itemId);
        List itemPicList = storeItemService.getItemPic(itemId);
        Item item = new Item();
        if (itemList.size() != 0) {
            item = (Item) itemList.get(0);
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("item", item);
        map.put("itemPicList", itemPicList);
        return map;
    }
    @RequestMapping("/review_item/{itemId}")
    @ResponseBody
    public Map getItem(@PathVariable int itemId) {
        List itemList = storeItemService.getItemById(itemId);
        Item item = new Item();
        if (itemList.size() != 0) {
            item = (Item) itemList.get(0);
        }
        item.setDescription("");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("item", item);
        return map;
    }

    @RequestMapping("/find/{key}")
    @ResponseBody
    public List getItemByName(@PathVariable String key, int page, String type, String orderBy) {
        if ("undefined".equals(orderBy)) {
            orderBy = null;
        }
        List list;
        if ("grid".equals(type)) {
            Object pageSize = request.getSession().getAttribute("gridPageSize");
            if (pageSize == null) {
                list = itemBaseService.getItemByName(key, page, PageSizeConstant.GRID_PAGE_SIZE, orderBy);
            } else  {
                list = itemBaseService.getItemByName(key, page, Integer.parseInt(pageSize.toString()), orderBy);
            }
        } else  {
            Object pageSize = request.getSession().getAttribute("listPageSize");
            if (pageSize == null) {
                list = itemBaseService.getItemByName(key, page, PageSizeConstant.LIST_PAGE_SIZE, orderBy);
            } else  {
                list = itemBaseService.getItemByName(key, page, Integer.parseInt(pageSize.toString()), orderBy);
            }
        }
        return list;
    }

    @RequestMapping("/item_review")
    public List getItemReview(int itemId) {
        return reviewService.getItemEvaluate(itemId);
    }

    @RequestMapping("/page_size")
    @ResponseBody
    public void setPageSize(String type, int pageSize) {
        if ("grid".equals(type)) {
            request.getSession().setAttribute("gridPageSize", pageSize);
        } else {
            request.getSession().setAttribute("listPageSize", pageSize);
        }
    }

    @RequestMapping("/language")
    @ResponseBody
    public void changeLanguage(String language) {
        request.getSession().setAttribute("siteLanguage", language);
    }
}
