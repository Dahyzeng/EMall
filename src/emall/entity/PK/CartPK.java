package emall.entity.PK;

import java.io.Serializable;

/**
 * Created by taurinzeng on 2016/3/28.
 */
public class CartPK implements Serializable{
    private String userId;
    private String itemId;

    public CartPK() {
    }

    public CartPK(String userId, String itemId) {
        this.userId = userId;
        this.itemId = itemId;
    }

    @Override
    public boolean equals(Object obj) {
        if(this == obj) return true;
        if(obj == null) return false;
        if(!(obj instanceof CartPK)) return false;
        CartPK objKey = (CartPK)obj;
        return userId.equalsIgnoreCase(objKey.userId) && itemId.equalsIgnoreCase(objKey.itemId);
    }

    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((userId == null) ? 0 : userId.hashCode());
        result = PRIME * result + ((itemId == null) ? 0 : itemId.hashCode());
        return result;
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
