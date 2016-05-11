package emall.service.user.order;

import emall.dao.profile.user.OrderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by taurin on 2016/4/29.
 */
@Service
public class OrderService {
    @Autowired
    OrderDao orderDao;

    public List getUserOrder(int userId) {
        return orderDao.getUserOrder(userId);
    }
}
