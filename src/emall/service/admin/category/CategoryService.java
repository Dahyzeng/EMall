package emall.service.admin.category;

import emall.dao.category.CategoryDao;
import emall.dao.profile.admin.LogDao;
import emall.entity.Admin;
import emall.entity.AdminLog;
import emall.entity.Category;
import emall.util.string.Constants;
import emall.util.string.constants.AdminConstants;
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
        AdminLog adminLog = getAdminLog();
        StringBuilder operation = new StringBuilder();
        operation.append(AdminConstants.ADD_CATEGORY_LOG);
        operation.append(category.getCategoryName());
        adminLog.setOperation(operation.toString());
        logDao.addLog(adminLog);
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
        categoryDao.deleteCategory(category.getId());
        AdminLog adminLog = getAdminLog();
        StringBuilder operation = new StringBuilder();
        operation.append(AdminConstants.DELETE_CATEGORY_LOG);
        operation.append(category.getCategoryName());
        adminLog.setOperation(operation.toString());
        logDao.addLog(adminLog);
        return Constants.SUCCESS_NUMBER;
    }
    public String getSessionName() {
        return request.getSession().getAttribute("adminName").toString();
    }

    public AdminLog getAdminLog() {
        Timestamp date = new Timestamp(new Date().getTime());
        AdminLog log = new AdminLog();
        log.setAdminName(getSessionName());
        log.setDate(date);
        return log;
    }
}
