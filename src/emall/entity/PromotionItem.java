package emall.entity;

/**
 * Created by taurinzeng on 2016/3/25.
 */
public class PromotionItem {
    private String itemId;
    private float discount;
    private float price;

    public PromotionItem() {
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
