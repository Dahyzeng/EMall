package emall.service.merchant.category;

import emall.dao.category.CategoryDao;
import emall.dao.profile.merchant.LogDao;
import emall.entity.MerchantLog;
import emall.entity.Category;
import emall.util.string.Constants;
import emall.util.string.constants.MerchantConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by taurinzeng on 2015/12/23.
 */
@Service
public class CategoryService {

    @Autowired
    private CategoryDao categoryDao;

    @Autowired
    private LogDao logDao;

    @Autowired
    private HttpServletRequest request;

    /**
     * function:
     * add new category, if there are any exception roll back
     * @param category adding category
     */
    @Transactional(rollbackFor = Exception.class)
    public int addCategory(Category category) {
        categoryDao.addCategory(category);
        MerchantLog merchantLog = getAdminLog();
        StringBuilder operation = new StringBuilder();
        operation.append(MerchantConstants.ADD_CATEGORY_LOG);
        operation.append(category.getCategoryName());
        merchantLog.setOperation(operation.toString());
        logDao.addLog(merchantLog);
        return Constants.SUCCESS_NUMBER;
    }

    public int matchCategory(Category category) {
        return categoryDao.matchCategoryName(category.getCategoryName(), category.getFatherId());
    }
    /**
     * function:
     * find whether current category has child category, if does, can not be deleted
     * @param categoryId current category
     * @return 0 for none
     * other for having child category
     */
    public int findChildCategory(int categoryId) {
        return categoryDao.findChildCategory(categoryId);
    }

    public int findItem(int categoryId) {
        return categoryDao.findItem(categoryId);
    }

    public List getAllCategory() {
        List<Map> categoryList = new ArrayList<Map>();
        List<Category> fatherCategoryList = categoryDao.getAllFatherCategory();
        for (Category category : fatherCategoryList) {
            Map<String, Object> categoryMap = new HashMap<String, Object>();
            List<Category> childCategoryList = categoryDao.getChildCategory(category.getCategoryId());
            categoryMap.put("fatherCategory", category);
            categoryMap.put("childCategories", childCategoryList);
            categoryList.add(categoryMap);
        }
        return categoryList;
    }

    /**
     * function:
     * delete current category,before delete,function findChildCategory
     * should be called
     * @param category current category
     * @return
     * 1 for success
     * 0 for fail
     */
    @Transactional(rollbackFor = Exception.class)
    public int deleteCurrentCategory(Category category) {
        categoryDao.deleteCategory(category.getCategoryId());
        MerchantLog merchantLog = getAdminLog();
        StringBuilder operation = new StringBuilder();
        operation.append(MerchantConstants.DELETE_CATEGORY_LOG);
        operation.append(category.getCategoryName());
        merchantLog.setOperation(operation.toString());
        logDao.addLog(merchantLog);
        return Constants.SUCCESS_NUMBER;
    }

    /**
     * function:
     * modify category name
     * @param category current category
     *        categoryId: old category name, categoryName: modified category name
     * @return
     * 1 for success
     * 0 for fail
     */
    @Transactional(rollbackFor = Exception.class)
    public int modifyCategory(Category category) {
        categoryDao.modifyCategory(category);
        MerchantLog merchantLog = getAdminLog();
        StringBuilder operation = new StringBuilder();
        operation.append(MerchantConstants.MODIFY_CATEGORY_LOG);
        operation.append(category.getFatherId());
        operation.append(" --> ");
        operation.append(category.getCategoryName());
        merchantLog.setOperation(operation.toString());
        logDao.addLog(merchantLog);
        return Constants.SUCCESS_NUMBER;
    }

    public String getCategoryName(int categoryId) {
        return (String) categoryDao.getCategoryName(categoryId);
    }

    public String getSessionName() {
        return request.getSession().getAttribute("merchantName").toString();
    }

    public MerchantLog getAdminLog() {
        SimpleDateFormat toDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp date = Timestamp.valueOf(toDateTime.format(new Date().getTime()));
        MerchantLog log = new MerchantLog();
        log.setMerchantName(getSessionName());
        log.setDate(date);
        return log;
    }

    public void setCategoryDao(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }
}
