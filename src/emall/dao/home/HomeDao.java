package emall.dao.home;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by taurin on 2016/5/22.
 */
@Repository
public class HomeDao {
    @Autowired
    private SessionFactory sessionFactory;
}
