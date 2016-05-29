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
    @Column(name = "order_id")
    private String orderId;

    @Id
    @Column(name = "item_id")
    private int itemId;

    @Column(name = "quantity")
    private int quantity;

    @Column(name = "unit_cost")
    private float unitCost;

    @Column(name = "evaluated")
    private int evaluated;

    public OrderItem() {
    }

    public OrderItem(String orderId, int itemId, int quantity, float unitCost) {
        this.orderId = orderId;
        this.itemId = itemId;
        this.quantity = quantity;
        this.unitCost = unitCost;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
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

    public float getUnitCost() {
        return unitCost;
    }

    public void setUnitCost(float unitCost) {
        this.unitCost = unitCost;
    }

    public int getEvaluated() {
        return evaluated;
    }

    public void setEvaluated(int evaluated) {
        this.evaluated = evaluated;
    }
}
