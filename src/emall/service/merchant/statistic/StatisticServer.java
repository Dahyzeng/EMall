package emall.service.merchant.statistic;

import emall.dao.statistic.StatisticDao;
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
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        calendar.add(Calendar.DATE, 1);
        String end = format.format(calendar.getTime());
        calendar.add(Calendar.DATE, -1);
        String start = format.format(calendar.getTime());
        int count = statisticDao.getOrderCountPerDay(start, end);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(start, count);
        list.add(map);
        for (int i = 0; i < 6; i++) {
            Map<String, Object> map1 = new HashMap<String, Object>();
            start = format.format(calendar.getTime());
            calendar.add(Calendar.DATE, -1);
            end = format.format(calendar.getTime());
            count = statisticDao.getOrderCountPerDay(start, end);
            map1.put(end, count);
            list.add(map1);
        }
        return list;
    }
}
