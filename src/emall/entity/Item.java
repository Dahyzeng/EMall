package emall.entity;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

/**
 * Created by taurinzeng on 2016/3/25.
 */
@Entity
@Table(name = "T_ITEM")
public class Item {
    @Id
    @Column(name = "item_id")
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name = "system-uuid",strategy="uuid")
    private String itemId;

    @Column(name = "item_name")
    @NotEmpty
    private String itemName;

    @Column(name = "category_id")
    private String categoryId;

    @Column(name = "inventory")
    private int inventory;

    @Column(name = "price")
    private float price;

    @Column(name = "description")
    private String description;

    @Column(name = "show_pic_url")
    private String showPicURL;

    @Column(name = "sale_quantity")
    private int saleQuantity;

    @Column(name = "discount")
    private float discount;

    @Column(name = "status")
    private int status;

    public Item() {
    }

    @Override
    public String toString() {
        return "Item{" +
                "itemId='" + itemId + '\'' +
                ", itemName='" + itemName + '\'' +
                ", categoryId='" + categoryId + '\'' +
                ", inventory=" + inventory +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", showPicURL='" + showPicURL + '\'' +
                ", saleQuantity=" + saleQuantity +
                ", status=" + status +
                '}';
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getShowPicURL() {
        return showPicURL;
    }

    public void setShowPicURL(String showPicURL) {
        this.showPicURL = showPicURL;
    }

    public int getSaleQuantity() {
        return saleQuantity;
    }

    public void setSaleQuantity(int saleQuantity) {
        this.saleQuantity = saleQuantity;
    }

    public int getStatus() {
        return status;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
