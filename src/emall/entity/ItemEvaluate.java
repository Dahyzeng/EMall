package emall.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import emall.entity.PK.ItemEvaluatePK;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by taurin on 2016/5/29.
 */
@Entity
@Table(name = "T_ITEM_EVALUATE")
@IdClass(ItemEvaluatePK.class)
public class ItemEvaluate {
    @Id
    @Column(name = "item_id")
    private int itemId;

    @Id
    @Column(name = "quality_level")
    private int qualityLevel;
    @Id
    @Column(name = "price_level")
    private int priceLevel;

    @Id
    @Column(name = "comment")
    private String comment;

    @Id
    @Column(name = "date")
    private Timestamp date;

    @Column(name = "user_id")
    private int userId;

    @Column(name = "username")
    private String username;

    public ItemEvaluate() {
    }

    public ItemEvaluate(int itemId, int qualityLevel, int priceLevel, String comment, int userId, String username) {
        this.itemId = itemId;
        this.qualityLevel = qualityLevel;
        this.priceLevel = priceLevel;
        this.comment = comment;
        this.userId = userId;
        this.username = username;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getQualityLevel() {
        return qualityLevel;
    }

    public void setQualityLevel(int qualityLevel) {
        this.qualityLevel = qualityLevel;
    }

    public int getPriceLevel() {
        return priceLevel;
    }

    public void setPriceLevel(int priceLevel) {
        this.priceLevel = priceLevel;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
