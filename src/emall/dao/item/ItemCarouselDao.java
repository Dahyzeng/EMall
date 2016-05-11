package emall.dao.item;

import emall.entity.CarouselItem;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by taurin on 2016/4/16.
 */
@Repository
public class ItemCarouselDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void addCarouselItem(CarouselItem carouselItem) {

        sessionFactory.getCurrentSession().saveOrUpdate(carouselItem);
    }

    public List getAllCarouseItem() {
        Query query = sessionFactory.getCurrentSession().createQuery("from CarouselItem order by sequence ASC");
        return query.list();
    }

    public void deleteCarouselPic(int itemId) {
        Query query = sessionFactory.getCurrentSession().createQuery("delete CarouselItem where item_id=?");
        query.setInteger(0, itemId);
        query.executeUpdate();
    }
}
