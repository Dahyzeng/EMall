package emall.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by taurinzeng on 2016/3/25.
 */
@Entity
@Table(name = "T_PROMOTION_ITEM")
public class PromotionItem implements Serializable{
    @Id
    @Column(name = "item_id")
    private String itemId;

    @Column(name = "discount")
    private float discount;

    @Column(name = "price")
    private float price;

    public PromotionItem() {
    }

    public PromotionItem(String itemId, float discount, float price) {
        this.itemId = itemId;
        this.discount = discount;
        this.price = price;
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
}
