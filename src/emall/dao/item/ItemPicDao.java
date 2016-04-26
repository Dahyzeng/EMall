package emall.dao.item;

import emall.entity.ItemPic;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by taurin on 2016/4/15.
 */
@Repository

public class ItemPicDao {
    @Autowired
    private SessionFactory sessionFactory;

    public List getItemPic(String itemId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from ItemPic where itemId=?");
        query.setString(0, itemId);
        return query.list();
    }

    public void addItemPic(ItemPic itemPic) {
        sessionFactory.getCurrentSession().persist(itemPic);
    }

    public void deleteItemPic(ItemPic itemPic) {
        Query query = sessionFactory.getCurrentSession().createQuery("delete ItemPic where itemId=? and picURL=?");
        query.setString(0, itemPic.getItemId());
        query.setString(1, itemPic.getPicURL());
        query.executeUpdate();
    }
}
