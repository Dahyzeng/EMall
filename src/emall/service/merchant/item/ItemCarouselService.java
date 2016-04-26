package emall.service.merchant.item;

import emall.dao.item.ItemCarouselDao;
import emall.dao.profile.merchant.LogDao;
import emall.entity.CarouselItem;
import emall.entity.MerchantLog;
import emall.util.string.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * Created by taurin on 2016/4/16.
 */
@Service
public class ItemCarouselService {
    @Autowired
    private ItemCarouselDao itemCarouselDao;

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private LogDao logDao;

    @Transactional(rollbackFor = Exception.class)
    public int addCarousel(CarouselItem carouselItem, String itemName) {
        itemCarouselDao.addCarouselItem(carouselItem);
        MerchantLog log = getAdminLog();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("add '");
        stringBuilder.append(itemName);
        stringBuilder.append("' carouse picture");
        log.setOperation(stringBuilder.toString());
        logDao.addLog(log);
        return Constants.SUCCESS_NUMBER;
    }

    @Transactional(rollbackFor = Exception.class)
    public int deleteCarousel(String itemId, String itemName) {
        itemCarouselDao.deleteCarouselPic(itemId);
        MerchantLog log = getAdminLog();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("delete '");
        stringBuilder.append(itemName);
        stringBuilder.append("' carouse picture");
        log.setOperation(stringBuilder.toString());
        logDao.addLog(log);
        return Constants.SUCCESS_NUMBER;
    }

    public List getCarousel() {
        return itemCarouselDao.getAllCarouseItem();
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
