package emall.entity.PK;

import java.io.Serializable;

/**
 * Created by taurinzeng on 2016/3/28.
 */
public class CartPK implements Serializable{
    private Integer userId;
    private Integer itemId;

    public CartPK() {
    }

    public CartPK(int userId, int itemId) {
        this.userId = userId;
        this.itemId = itemId;
    }

    @Override
    public boolean equals(Object obj) {
        if(this == obj) return true;
        if(obj == null) return false;
        if(!(obj instanceof CartPK)) return false;
        CartPK objKey = (CartPK)obj;
        return userId.equals(objKey.userId) && itemId.equals(objKey.itemId);
    }

    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((userId == null) ? 0 : userId.hashCode());
        result = PRIME * result + ((itemId == null) ? 0 : itemId.hashCode());
        return result;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }
}
