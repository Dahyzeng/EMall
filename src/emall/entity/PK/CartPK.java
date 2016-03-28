package emall.entity.PK;

import java.io.Serializable;

/**
 * Created by taurinzeng on 2016/3/28.
 */
public class CartPK implements Serializable{
    private String cartId;
    private String userId;
    private String itemId;

    public CartPK() {
    }

    public CartPK(String cartId, String userId, String itemId) {
        this.cartId = cartId;
        this.userId = userId;
        this.itemId = itemId;
    }

    @Override
    public boolean equals(Object obj) {
        if(this == obj) return true;
        if(obj == null) return false;
        if(!(obj instanceof CartPK)) return false;
        CartPK objKey = (CartPK)obj;
        return cartId.equalsIgnoreCase(objKey.cartId) && userId.equalsIgnoreCase(objKey.userId) && itemId.equalsIgnoreCase(objKey.itemId);
    }

    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((cartId == null) ? 0 : cartId.hashCode());
        result = PRIME * result + ((userId == null) ? 0 : userId.hashCode());
        result = PRIME * result + ((itemId == null) ? 0 : itemId.hashCode());
        return result;
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
}
