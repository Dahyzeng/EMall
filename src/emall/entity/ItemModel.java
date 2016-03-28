package emall.entity;

/**
 * Created by taurinzeng on 2016/3/25.
 */
public class ItemModel {
    private String categoryId;
    private String model;

    public ItemModel() {
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }
}
