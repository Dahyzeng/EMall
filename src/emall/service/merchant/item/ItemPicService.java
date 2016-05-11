package emall.service.merchant.item;

import emall.dao.item.ItemPicDao;
import emall.dao.profile.merchant.LogDao;
import emall.entity.ItemPic;
import emall.entity.MerchantLog;
import emall.util.string.Constants;
import emall.util.string.constants.MerchantConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by taurin on 2016/4/15.
 */
@Service
public class ItemPicService {
    @Autowired
    private ItemPicDao itemPicDao;

    @Autowired
    private LogDao logDao;

    @Autowired
    private HttpServletRequest request;

    public List getItemPic(int itemId) {
        return itemPicDao.getItemPic(itemId);
    }

    @Transactional(rollbackFor = Exception.class)
    public int addItemPic(ItemPic itemPic, String itemName, String fileName) {
        itemPicDao.addItemPic(itemPic);
        MerchantLog log = getMerchantLog();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("'");
        stringBuilder.append(itemName);
        stringBuilder.append("' add a pic named ");
        stringBuilder.append(fileName);
        log.setOperation(stringBuilder.toString());
        logDao.addLog(log);
        return Constants.SUCCESS_NUMBER;
    }

    @Transactional(rollbackFor = Exception.class)
    public int deleteItemPic(ItemPic itemPic, String itemName) {
        itemPicDao.deleteItemPic(itemPic);
        MerchantLog log = getMerchantLog();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("delete item");
        stringBuilder.append(itemName);
        stringBuilder.append("' pic");
        log.setOperation(stringBuilder.toString());
        logDao.addLog(log);
        return Constants.SUCCESS_NUMBER;
    }

    public String getSessionName() {
        return request.getSession().getAttribute("merchantName").toString();
    }
    public MerchantLog getMerchantLog() {
        SimpleDateFormat toDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp date = Timestamp.valueOf(toDateTime.format(new Date().getTime()));
        MerchantLog log = new MerchantLog();
        log.setMerchantName(getSessionName());
        log.setDate(date);
        return log;
    }
}
