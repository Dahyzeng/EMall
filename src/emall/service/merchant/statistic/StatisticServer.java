package emall.service.merchant.statistic;

import emall.dao.statistic.StatisticDao;
import emall.entity.Item;
import emall.entity.Statistic;
import emall.util.string.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by taurin on 2016/5/20.
 */
@Service
public class StatisticServer {
    @Autowired
    private StatisticDao statisticDao;

    @Transactional(rollbackFor = Exception.class)
    public int updateItemCount() {
        statisticDao.updateItemCount();
        return Constants.SUCCESS_NUMBER;
    }

    @Transactional(rollbackFor = Exception.class)
    public int updateTotalPrice(float price) {
        statisticDao.updateTotalPrice(price);
        return Constants.SUCCESS_NUMBER;
    }

    @Transactional(rollbackFor = Exception.class)
    public int updateFinishedOrder() {
        statisticDao.updateFinishedOrder();
        return Constants.SUCCESS_NUMBER;
    }
    @Transactional(rollbackFor = Exception.class)
    public int updateUsers() {
        statisticDao.updateUserCount();
        return Constants.SUCCESS_NUMBER;
    }

    public Statistic getStatistic() {
        return statisticDao.getStatistic();
    }

    public List getStatisticByWeek() {
        List<Map> list = new ArrayList<Map>();

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat format1 = new SimpleDateFormat("MM-dd");
        String start;
        String end;
        String record;
        for (int i = 0; i < 7; i++) {
            Calendar calendar = Calendar.getInstance();
            Map<String, Object> map = new HashMap<String, Object>();
            calendar.add(Calendar.DATE, -i);
            start = format.format(calendar.getTime());
            record = format1.format(calendar.getTime());
            calendar.add(Calendar.DATE, 1);
            end = format.format(calendar.getTime());
            int count = statisticDao.getOrderCountPerDay(start, end);
            map.put(record, count);
            list.add(map);
        }
        return list;
    }

    public List getTopTen() {
        List<Map> needList = new ArrayList<Map>();
        List itemList = statisticDao.getSaleTopTen();
        for (Object tmp : itemList) {
            Map<String, Object> map = new HashMap<String, Object>();
            Item item = (Item) tmp;
            map.put("name", item.getItemName());
            map.put("sells", item.getSaleQuantity());
            needList.add(map);
        }
        return needList;
    }
}
