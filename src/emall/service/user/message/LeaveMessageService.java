package emall.service.user.message;

import emall.dao.message.LeaveMessageDao;
import emall.entity.LeaveMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by taurin on 2016/5/7.
 */
@Service
public class LeaveMessageService {
    @Autowired
    private LeaveMessageDao leaveMessageDao;

    @Transactional(rollbackFor = Exception.class)
    public void addMessage(LeaveMessage leaveMessage) {
        leaveMessageDao.addLeaveMessage(leaveMessage);
    }
}
