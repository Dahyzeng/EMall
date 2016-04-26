package emall.entity;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by taurinzeng on 2016/3/25.
 */
@Entity
@Table(name="T_CAROUSE_ITEM")
public class CarouselItem implements Serializable{

    @Id
    @Column(name = "item_id")
    private String ItemId;

    @Column(name = "pic_url")
    @NotEmpty
    private String picURL;

    @Column(name = "sequence")
    private int sequence;

    public CarouselItem() {
    }

    public CarouselItem(String itemId, String picURL, int sequence) {
        ItemId = itemId;
        this.picURL = picURL;
        this.sequence = sequence;
    }

    public String getItemId() {
        return ItemId;
    }

    public void setItemId(String itemId) {
        ItemId = itemId;
    }

    public String getPicURL() {
        return picURL;
    }

    public void setPicURL(String picURL) {
        this.picURL = picURL;
    }

    public int getSequence() {
        return sequence;
    }

    public void setSequence(int sequence) {
        this.sequence = sequence;
    }
}
