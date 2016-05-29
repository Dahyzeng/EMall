package emall.entity.PK;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * Created by taurin on 2016/5/29.
 */
public class ItemEvaluatePK implements Serializable{
    private Integer itemId;
    private Integer priceLevel;
    private Integer qualityLevel;
    private String comment;
    private Timestamp date;

    public ItemEvaluatePK() {
    }

    @Override
    public boolean equals(Object obj) {
        if(this == obj) return true;
        if(obj == null) return false;
        if(!(obj instanceof OrderItemPK)) return false;
        ItemEvaluatePK objKey = (ItemEvaluatePK)obj;
        return itemId.equals(objKey.itemId) && comment.equalsIgnoreCase(objKey.comment) && priceLevel.equals(objKey.priceLevel) && date.equals(objKey.date) && qualityLevel.equals(objKey.qualityLevel);
    }

    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((qualityLevel == null) ? 0 : qualityLevel.hashCode());
        result = PRIME * result + ((priceLevel == null) ? 0 : priceLevel.hashCode());
        result = PRIME * result + ((itemId == null) ? 0 : itemId.hashCode());
        result = PRIME * result + ((comment == null) ? 0 : comment.hashCode());
        result = PRIME * result + ((date == null) ? 0 : date.hashCode());
        return result;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public Integer getPriceLevel() {
        return priceLevel;
    }

    public void setPriceLevel(Integer priceLevel) {
        this.priceLevel = priceLevel;
    }

    public Integer getQualityLevel() {
        return qualityLevel;
    }

    public void setQualityLevel(Integer qualityLevel) {
        this.qualityLevel = qualityLevel;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
}
