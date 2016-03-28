package emall.entity;

import emall.entity.PK.OrderItemPK;

import javax.persistence.*;

/**
 * Created by taurinzeng on 2016/3/25.
 */
@Entity
@Table(name = "T_ORDER_ITEM")
@IdClass(OrderItemPK.class)
public class OrderItem {
    @Id
    @ManyToOne(targetEntity = Order.class)
    @JoinColumn(name = "order_id", referencedColumnName = "order_id")
    private String orderId;

    @ManyToOne(targetEntity = Item.class)
    @JoinColumn(name = "item_id", referencedColumnName = "item_id")
    private String itemId;

    @Column(name = "quantity")
    private int quantity;

    public OrderItem() {
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
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
