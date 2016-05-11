package emall.service.merchant.message;

import emall.dao.message.LeaveMessageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by taurin on 2016/5/7.
 */
@Service
public class MessageService {
    @Autowired
    private LeaveMessageDao leaveMessageDao;

    @Transactional(rollbackFor = Exception.class)
    public void deleteMessage(int messageId) {
        leaveMessageDao.deleteMessage(messageId);

    }

    public List getMessage(int status, int page, int size) {
        return leaveMessageDao.getMessages(status, page, size);
    }

    public List getDetailMessage(int id) {
        return leaveMessageDao.getDetailMessage(id);
    }
}
