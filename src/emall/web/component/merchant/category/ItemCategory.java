package emall.web.component.merchant.category;

import emall.entity.Category;
import emall.service.merchant.category.CategoryService;
import emall.util.string.Constants;
import emall.util.string.constants.ErrorMessageConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taurin on 2016/4/9.
 */
@Component
@RequestMapping("/category")
public class ItemCategory {
    @Autowired
    private CategoryService categoryService;

    @Autowired
    HttpServletRequest request;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Map addCategory(Category category) {
        Map<String, Object> categoryMap = checkStatus();
        if (!(Boolean)categoryMap.get("success")) {
            return categoryMap;
        }
        categoryMap.put("success", false);
        if (categoryService.matchCategory(category) == 1) {
            categoryMap.put("errorMessage", ErrorMessageConstant.ADD_CATEGORY_SAME_NAME_ERROR);
            return categoryMap;
        }
        if (categoryService.addCategory(category) == 1) {
            List categoryList = categoryService.getAllCategory();
            categoryMap.put("success", true);
            categoryMap.put("categoryArray", categoryList);
        } else {
            categoryMap.put("errorMessage", ErrorMessageConstant.ADD_CATEGORY_SYSTEM_ERROR);
        }
        return categoryMap;
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    @ResponseBody
    public Map modifyCategory(Category category) {
        Map<String, Object> categoryMap = checkStatus();
        if (!(Boolean)categoryMap.get("success")) {
            return categoryMap;
        }
        int oldCategoryName = category.getFatherId();
        category.setFatherId(0);
        categoryMap.put("success", false);
        if (categoryService.matchCategory(category) == 1) {
            categoryMap.put("errorMessage", ErrorMessageConstant.MODIFY_CATEGORY_SAME_NAME_ERROR);
            return categoryMap;
        }
        category.setFatherId(oldCategoryName);
        if (categoryService.modifyCategory(category) == 1) {
            List categoryList = categoryService.getAllCategory();
            categoryMap.put("success", true);
            categoryMap.put("categoryArray", categoryList);
        } else {
            categoryMap.put("errorMessage", ErrorMessageConstant.MODIFY_CATEGORY_SYSTEM_ERROR);
        }

        return categoryMap;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map deleteCategory(Category category) {
        Map<String, Object> categoryMap = checkStatus();
        if (!(Boolean)categoryMap.get("success")) {
            return categoryMap;
        }
        categoryMap.put("success", false);
        if (category.getFatherId() == 0) {
            if (categoryService.findChildCategory(category.getCategoryId()) > 0) {
                categoryMap.put("errorMessage", ErrorMessageConstant.DELETE_CATEGORY_HAS_CHILD);
                return categoryMap;
            }
        }
        if (categoryService.findItem(category.getCategoryId()) > 0) {
            categoryMap.put("errorMessage", ErrorMessageConstant.DELETE_CATEGORY_HAS_ITEM);
        } else if (categoryService.deleteCurrentCategory(category) == Constants.SUCCESS_NUMBER) {
            List categoryList = categoryService.getAllCategory();
            categoryMap.put("success", true);
            categoryMap.put("categoryArray", categoryList);
        } else {
            categoryMap.put("errorMessage", ErrorMessageConstant.ADD_CATEGORY_SYSTEM_ERROR);
        }
        return categoryMap;
    }
    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ResponseBody
    public Map getAllCategory() {
        Map<String, Object> categoryMap = checkStatus();
        if (!(Boolean)categoryMap.get("success")) {
            return categoryMap;
        }
        categoryMap.put("success", true);
        categoryMap.put("categoryArray", categoryService.getAllCategory());
        return categoryMap;
    }

    public Map<String, Object> checkStatus() {
        Map<String, Object> categoryMap = new HashMap<String, Object>();
        categoryMap.put("success",true);
        Object merchantName = request.getSession().getAttribute("merchantName");
        if (merchantName == null) {
            categoryMap.put("success", false);
            categoryMap.put("errorMessage", ErrorMessageConstant.NO_LOGIN_ERROR);
        }
        return categoryMap;
    }
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }
}
