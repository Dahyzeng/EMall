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
import java.util.Date;

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

    /**
     * function:
     * find whether current category has child category, if does, can not be deleted
     * @param categoryId current category
     * @return 0 for none
     * other for having child category
     */
    public int findChildCategory(String categoryId) {
        return categoryDao.findChildCategory(categoryId);
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
    public String getSessionName() {
        return request.getSession().getAttribute("merchantName").toString();
    }

    public MerchantLog getAdminLog() {
        Timestamp date = new Timestamp(new Date().getTime());
        MerchantLog log = new MerchantLog();
        log.setMerchantName(getSessionName());
        log.setDate(date);
        return log;
    }
}
