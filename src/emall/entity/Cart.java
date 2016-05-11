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
    private int userId;

    @Id
    @Column(name = "item_id")
    private int itemId;

    @Column(name = "quantity")
    private int quantity;

    public Cart() {
    }


    public Cart(int userId, int itemId, int quantity) {
        this.userId = userId;
        this.itemId = itemId;
        this.quantity = quantity;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
