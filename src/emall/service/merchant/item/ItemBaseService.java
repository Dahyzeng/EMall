package emall.service.merchant.item;

import emall.dao.category.CategoryDao;
import emall.dao.item.ItemBaseDao;
import emall.dao.profile.merchant.LogDao;
import emall.dao.statistic.StatisticDao;
import emall.entity.Category;
import emall.entity.Item;
import emall.entity.MerchantLog;
import emall.entity.PromotionItem;
import emall.util.string.Constants;
import emall.util.string.constants.MerchantConstants;
import emall.util.string.constants.PageSizeConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by taurin on 2016/4/12.
 */
@Service
public class ItemBaseService {
    @Autowired
    private ItemBaseDao itemBaseDao;

    @Autowired
    private CategoryDao categoryDao;

    @Autowired
    private LogDao logDao;

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private StatisticDao statisticDao;

    @Transactional(rollbackFor = Exception.class)
    public int addItem(Item item) {
        itemBaseDao.addItem(item);
        statisticDao.updateItemCount();
        MerchantLog merchantLog = getAdminLog();
        StringBuilder operation = new StringBuilder();
        operation.append(MerchantConstants.ADD_ITEM_LOG);
        operation.append(item.getItemName());
        merchantLog.setOperation(operation.toString());
        logDao.addLog(merchantLog);
        return Constants.SUCCESS_NUMBER;
    }

    public void updateItemDiscount(Item item) {
        itemBaseDao.updateItemDiscount(item);
    }

    @Transactional(rollbackFor = Exception.class)
    public int updateItem(Item item) {
        itemBaseDao.updateItem(item);
        MerchantLog merchantLog = getAdminLog();
        StringBuilder operation = new StringBuilder();
        operation.append(MerchantConstants.EDIT_ITEM_LOG);
        operation.append(item.getItemName());
        merchantLog.setOperation(operation.toString());
        logDao.addLog(merchantLog);
        return Constants.SUCCESS_NUMBER;
    }

    @Transactional(rollbackFor = Exception.class)
    public int deleteItem(Item item) {
        itemBaseDao.deleteItem(item.getItemId());
        MerchantLog merchantLog = getAdminLog();
        StringBuilder operation = new StringBuilder();
        operation.append(MerchantConstants.DELETE_ITEM_LOG);
        operation.append(item.getItemName());
        merchantLog.setOperation(operation.toString());
        logDao.addLog(merchantLog);
        return Constants.SUCCESS_NUMBER;
    }

    @Transactional(rollbackFor = Exception.class)
    public int changeItemStatus(Item item) {
        itemBaseDao.changeStatus(item.getItemId(), item.getStatus());
        MerchantLog merchantLog = getAdminLog();
        StringBuilder operation = new StringBuilder();
        operation.append("change item '");
        operation.append(item.getItemName());
        operation.append("' status: ");
        if (item.getStatus() == 1) {
            operation.append("online");
        } else {
            operation.append("offline");
        }
        merchantLog.setOperation(operation.toString());
        logDao.addLog(merchantLog);
        return Constants.SUCCESS_NUMBER;
    }

    @Transactional(rollbackFor = Exception.class)
    public int updateDiscount(PromotionItem promotionItem, String itemName) {
        itemBaseDao.updateDiscount(promotionItem);
        MerchantLog merchantLog = getAdminLog();
        StringBuilder operation = new StringBuilder();
        operation.append("add ");
        operation.append(promotionItem.getDiscount());
        operation.append(" discount for item '");
        operation.append(itemName);
        operation.append("'");
        merchantLog.setOperation(operation.toString());
        logDao.addLog(merchantLog);
        return Constants.SUCCESS_NUMBER;
    }

    public List getDiscount(int itemId) {
        return itemBaseDao.getDiscount(itemId);
    }

    public List getItemByCategory(Category category, int page, int status) {
        List itemList;
        if (category.getFatherId() == 0) {
            if (category.getCategoryId() == 0) {
                itemList = itemBaseDao.getItemsByCategoryId(null, page, status, PageSizeConstant.ITEM_PAGE_SIZE);
            } else {
                itemList = itemBaseDao.getItemsByCategoryId(category.getCategoryId(), page, status, PageSizeConstant.ITEM_PAGE_SIZE);
            }
        } else {
            List childCategory = categoryDao.getChildCategory(category.getFatherId());
            if (childCategory.size() != 0) {
                StringBuilder stringBuilder = new StringBuilder();
                for (Object tmp : childCategory) {
                    Category tmpCategory = (Category) tmp;
                    stringBuilder.append("'");
                    stringBuilder.append(tmpCategory.getCategoryId());
                    stringBuilder.append("',");
                }
                itemList = itemBaseDao.getItemsByCategoryId(stringBuilder, page, status, PageSizeConstant.ITEM_PAGE_SIZE);
            } else {
                itemList = itemBaseDao.getItemsByCategoryId(category.getFatherId(), page, status, PageSizeConstant.ITEM_PAGE_SIZE);
            }

        }
        return itemList;
    }
    public List getItemByName(String name, int page, int pageSize, String orderBy) {
        return itemBaseDao.getItemByName(name, page, pageSize, orderBy);
    }
    public List getItemById(int itemId) {
        return itemBaseDao.getItemById(itemId);
    }
    public String getItemNameById(int itemId) {
        return itemBaseDao.getItemNameById(itemId).toString();
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
}
