package emall.entity.PK;

/**
 * Created by taurinzeng on 2016/3/28.
 */
public class OrderItemPK {
    private String orderId;
    private String itemId;

    public OrderItemPK() {
    }

    @Override
    public boolean equals(Object obj) {
        if(this == obj) return true;
        if(obj == null) return false;
        if(!(obj instanceof OrderItemPK)) return false;
        OrderItemPK objKey = (OrderItemPK)obj;
        return orderId.equalsIgnoreCase(objKey.orderId) && itemId.equalsIgnoreCase(objKey.itemId) && itemId.equalsIgnoreCase(objKey.itemId);
    }

    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((orderId == null) ? 0 : orderId.hashCode());
        result = PRIME * result + ((itemId == null) ? 0 : itemId.hashCode());
        return result;
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
}
