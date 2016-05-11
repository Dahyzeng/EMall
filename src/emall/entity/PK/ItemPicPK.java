package emall.entity.PK;

import java.io.Serializable;

/**
 * Created by taurin on 2016/3/28.
 */
public class ItemPicPK implements Serializable{
    private Integer itemId;
    private String picURL;

    public ItemPicPK() {
    }

    @Override
    public boolean equals(Object obj) {
        if(this == obj) return true;
        if(obj == null) return false;
        if(!(obj instanceof OrderItemPK)) return false;
        ItemPicPK objKey = (ItemPicPK)obj;
        return itemId.equals(objKey.itemId) && picURL.equalsIgnoreCase(objKey.picURL);
    }

    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((picURL == null) ? 0 : picURL.hashCode());
        result = PRIME * result + ((itemId == null) ? 0 : itemId.hashCode());
        return result;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public String getPicURL() {
        return picURL;
    }

    public void setPicURL(String picURL) {
        this.picURL = picURL;
    }
}
