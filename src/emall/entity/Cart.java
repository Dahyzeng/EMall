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
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name = "system-uuid",strategy="uuid")
    @Column(name = "cart_id")
    private String cartId;

    @Id
    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private String userId;

    @Id
    @ManyToOne(targetEntity = Item.class)
    @JoinColumn(name = "item_id", referencedColumnName = "item_id")
    private String itemId;

    @Column(name = "quantity")
    private int quantity;

    public Cart() {
    }

    public String getCartId() {
        return cartId;
    }

    public void setCartId(String cartId) {
        this.cartId = cartId;
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
