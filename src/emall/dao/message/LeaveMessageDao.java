package emall.dao.message;

import emall.entity.LeaveMessage;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by taurin on 2016/5/7.
 */
@Repository
public class LeaveMessageDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void addLeaveMessage(LeaveMessage leaveMessage) {
        sessionFactory.getCurrentSession().save(leaveMessage);
    }

    public void deleteMessage(String messageId) {
        Query query = sessionFactory.getCurrentSession().createQuery("delete LeaveMessage where id=?");
        query.setString(0, messageId);
        query.executeUpdate();
    }

    public List getMessages(int status, int page, int size) {
        Query query = sessionFactory.getCurrentSession().createQuery("from LeaveMessage where status=?");
        query.setInteger(0, status);
        query.setMaxResults(size);
        query.setFirstResult((page - 1) * size);
        return query.list();
    }
}
