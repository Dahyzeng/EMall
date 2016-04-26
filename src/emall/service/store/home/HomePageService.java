package emall.service.store.home;

import emall.dao.item.ItemCarouselDao;
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

    public List getAllCarousel() {
        return itemCarouselDao.getAllCarouseItem();
    }

}
