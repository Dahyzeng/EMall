package emall.service.store.common;

import emall.dao.category.CategoryDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by taurin on 2016/4/17.
 */
@Service
public class StoreCategoryService {
    @Autowired
    private CategoryDao categoryDao;

    public List getFatherCategory() {
        return categoryDao.getAllFatherCategory();
    }

    public List getChildCategory(String fatherId) {
        return categoryDao.getChildCategory(fatherId);
    }
}
