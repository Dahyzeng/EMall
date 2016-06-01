package emall.dao.profile.merchant;

import emall.entity.MallInfo;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by taurin on 2016/5/31.
 */
@Repository
public class MallDao {
    @Autowired
    SessionFactory sessionFactory;

    public void addOrUpdate(MallInfo mallInfo) {
        sessionFactory.getCurrentSession().saveOrUpdate(mallInfo);
    }

    public MallInfo getMallInfo() {
        Query query = sessionFactory.getCurrentSession().createQuery("from MallInfo");
        return (MallInfo) query.uniqueResult();
    }
}
