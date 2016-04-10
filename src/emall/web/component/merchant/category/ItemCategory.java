package emall.web.component.merchant.category;

import emall.entity.Category;
import emall.service.merchant.category.CategoryService;
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

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    @Transactional(rollbackFor = Exception.class)
    public Map addCategory(Category category, HttpServletRequest request) {
        Map<String, Object> categoryMap = new HashMap<String, Object>();
        Object merchantName = request.getSession().getAttribute("merchantName");
        if (merchantName == null) {
            categoryMap.put("success", false);
            categoryMap.put("errorMessage", ErrorMessageConstant.NO_LOGIN_ERROR);
            return categoryMap;
        }
        if (categoryService.matchCategory(category) == 1) {
            categoryMap.put("success", false);
            categoryMap.put("errorMessage", ErrorMessageConstant.ADD_CATEGORY_SAME_NAME_ERROR);
            return categoryMap;
        }
        if (categoryService.addCategory(category) == 1) {
            List categoryList = categoryService.getAllCategory();
            categoryMap.put("success", true);
            categoryMap.put("categoryArray", categoryList);
        } else {
            categoryMap.put("success", false);
            categoryMap.put("errorMessage", ErrorMessageConstant.ADD_CATEGORY_SYSTEM_ERROR);
        }
        return categoryMap;
    }

    @RequestMapping("/getAll")
    @ResponseBody
    public Map getAllCategory(HttpServletRequest request) {
        Map<String, Object> categoryMap = new HashMap<String, Object>();
        Object merchantName = request.getSession().getAttribute("merchantName");
        if (merchantName == null) {
            categoryMap.put("success", false);
            categoryMap.put("errorMessage", ErrorMessageConstant.NO_LOGIN_ERROR);
            return categoryMap;
        }
        categoryMap.put("success", true);
        categoryMap.put("categoryArray", categoryService.getAllCategory());
        return categoryMap;
    }

    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }
}
