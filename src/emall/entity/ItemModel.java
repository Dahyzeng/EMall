package emall.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by taurinzeng on 2016/3/25.
 */
@Entity
@Table(name = "T_ITEM_MODEL")
public class ItemModel {
    @Id
    @ManyToOne(targetEntity = Category.class)
    @JoinColumn(name = "category_id", referencedColumnName = "category_id")
    private String categoryId;

    @Column(name = "model")
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
