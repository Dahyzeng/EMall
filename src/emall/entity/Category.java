package emall.entity;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

/**
 * Created by taurinzeng on 2015/12/21.
 */
@Entity
@Table(name = "T_CATEGORY")
public class Category {
    @Id
    @Column(name = "category_id")
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int categoryId;

    @Column(name = "category_name")
    @NotEmpty(message = "category name can not be empty")
    private String categoryName;

    @Column(name = "father_id")
    private int fatherId;

    @Override
    public String toString() {
        return "{name: " + categoryName + ", categoryId: " + categoryId + ", fatherId: " + fatherId +"}";
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getFatherId() {
        return fatherId;
    }

    public void setFatherId(int fatherId) {
        this.fatherId = fatherId;
    }
}
