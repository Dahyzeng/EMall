package emall.dao.profile.merchant;

import emall.entity.MerchantLog;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taurinzeng on 2015/12/21.
 */

@Repository
public class LogDao {
    private SessionFactory sessionFactory;

    /**
     * function:
     * add merchant operation log
     * @param merchantLog MerchantLog entity
     */
    public void addLog(MerchantLog merchantLog) {
        sessionFactory.getCurrentSession().save(merchantLog);
    }

    /**
     * function:
     * get merchant's logs by page
     * @param merchantName start pageSize
     * @return logList
     */
    public Map getLogByName(String merchantName, int page, int pageSize) {
        Map <String, Object> map = new HashMap<String, Object>();
        Query query = sessionFactory.getCurrentSession().createQuery("from MerchantLog where merchantName like ? order by date DESC ");
        query.setString(0, "%" + merchantName + "%");
        int count = query.list().size();
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);
        map.put("logList", query.list());
        map.put("count", count);
        return map;
    }


    public Map getAllLog(int page, int pageSize) {
        Map <String, Object> map = new HashMap<String, Object>();
        Query query = sessionFactory.getCurrentSession().createQuery("from MerchantLog order by date DESC");
        int count = query.list().size();
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);
        map.put("logList", query.list());
        map.put("count", count);
        return map;
    }

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
