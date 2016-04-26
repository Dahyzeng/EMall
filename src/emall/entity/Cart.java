package emall.entity;

import emall.entity.PK.CartPK;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;


/**
 * Created by taurinzeng on 2016/3/25.
 */
@Entity
@Table(name = "T_CART")
@IdClass(CartPK.class)
public class Cart {

    @Id
    @Column(name = "user_id")
    private String userId;

    @Id
    @Column(name = "item_id")
    private String itemId;

    @Column(name = "quantity")
    private int quantity;

    public Cart() {
    }


    public Cart(String userId, String itemId, int quantity) {
        this.userId = userId;
        this.itemId = itemId;
        this.quantity = quantity;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
