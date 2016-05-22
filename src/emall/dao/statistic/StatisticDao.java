package emall.dao.statistic;

import emall.entity.Statistic;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by taurin on 2016/5/20.
 */
@Repository
public class StatisticDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void updateItemCount() {
        Query query = sessionFactory.getCurrentSession().createQuery("update Statistic set items=item+1");
        query.executeUpdate();
    }

    public void updateTotalPrice(float price) {
        Query query = sessionFactory.getCurrentSession().createQuery("update Statistic set sales=sales+?");
        query.setFloat(0, price);
        query.executeUpdate();
    }

    public void updateFinishedOrder() {
        Query query = sessionFactory.getCurrentSession().createQuery("update Statistic set totalFinishedOrder=totalFinishedOrder+1");
        query.executeUpdate();
    }
    public void updateUserCount() {
        Query query = sessionFactory.getCurrentSession().createQuery("update Statistic set users=users+1");
        query.executeUpdate();
    }

    public Statistic getStatistic() {
        Query query = sessionFactory.getCurrentSession().createQuery("from Statistic");
        return (Statistic) query.uniqueResult();
    }

    public List getSaleTopTen() {
        Query query = sessionFactory.getCurrentSession().createQuery("from Item order by saleQuantity");
        query.setMaxResults(10);
        return query.list();
    }

    public Integer getOrderCountPerDay(String start, String end) {
        Query query = sessionFactory.getCurrentSession().createQuery("select count(*) from Order where createTime between ? and ?");
        query.setString(0, start);
        query.setString(1, end);
        return Integer.parseInt(query.uniqueResult().toString());
    }
}
