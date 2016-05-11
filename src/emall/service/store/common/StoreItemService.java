package emall.service.store.common;

import emall.dao.category.CategoryDao;
import emall.dao.item.ItemBaseDao;
import emall.dao.item.ItemPicDao;
import emall.entity.Category;
import emall.util.string.constants.PageSizeConstant;
import emall.util.string.constants.StoreConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by taurin on 2016/4/17.
 */
@Service
public class StoreItemService {
    @Autowired
    private ItemBaseDao itemBaseDao;

    @Autowired
    private CategoryDao categoryDao;

    @Autowired
    private ItemPicDao itemPicDao;
    public List getItemByCategory(Category category, int page, int status, String pageType) {
        List itemList;
        if (category.getFatherId() == 0) {
            if ("grid".equals(pageType)) {
                itemList = itemBaseDao.getItemsByCategoryIdStore(category.getCategoryId(), page, status, PageSizeConstant.GRID_PAGE_SIZE);
            } else {
                itemList = itemBaseDao.getItemsByCategoryIdStore(category.getCategoryId(), page, status, PageSizeConstant.LIST_PAGE_SIZE);
            }
        } else {
            List childCategory = categoryDao.getChildCategory(category.getFatherId());
            if (childCategory.size() != 0) {
                StringBuilder stringBuilder = new StringBuilder();
                for (Object tmp : childCategory) {
                    Category tmpCategory = (Category) tmp;
                    stringBuilder.append("'");
                    stringBuilder.append(tmpCategory.getCategoryId());
                    stringBuilder.append("',");
                }
                itemList = itemBaseDao.getItemsByCategoryId(stringBuilder, page, status);
            } else {
                itemList = itemBaseDao.getItemsByCategoryId(category.getFatherId(), page, status);
            }

        }
        return itemList;
    }

    public List getItemById(int itemId) {
        return itemBaseDao.getItemById(itemId);
    }

    public List getItemPic(int itemId) {
        return itemPicDao.getItemPic(itemId);
    }
}
