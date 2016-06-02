package emall.service.store.home;

import emall.dao.item.ItemCarouselDao;
import emall.dao.profile.merchant.MallDao;
import emall.dao.statistic.StatisticDao;
import emall.entity.MallInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by taurin on 2016/4/17.
 */
@Service
public class HomePageService {
    @Autowired
    private ItemCarouselDao itemCarouselDao;

    @Autowired
    private StatisticDao statisticDao;

    @Autowired
    private MallDao mallDao;

    public List getAllCarousel() {
        return itemCarouselDao.getAllCarouseItem();
    }

    public List getTopTen() {
        return statisticDao.getSaleTopTenFront();
    }

    public MallInfo getMallInfo () {
       return mallDao.getMallInfo();

    }
}
