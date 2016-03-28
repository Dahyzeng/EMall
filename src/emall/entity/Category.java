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
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name = "system-uuid",strategy="uuid")
    private String categoryId;

    @Column(name = "category_name")
    @NotEmpty(message = "category name can not be empty")
    private String categoryName;

    @Column(name = "father_id")
    private String fatherId;

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getFatherId() {
        return fatherId;
    }

    public void setFatherId(String fatherId) {
        this.fatherId = fatherId;
    }
}
