package emall.entity;

import emall.entity.PK.ItemPicPK;

import javax.persistence.*;

/**
 * Created by taurinzeng on 2016/3/25.
 */
@Entity
@Table(name = "T_ITEM_PIC")
@IdClass(ItemPicPK.class)
public class ItemPic {
    @Id
    @ManyToOne(targetEntity = Item.class)
    @JoinColumn(name = "item_id", referencedColumnName = "item_id")
    private String itemId;

    @Id
    @Column(name = "pic_url")
    private String picURL;

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public String getPicURL() {
        return picURL;
    }

    public void setPicURL(String picURL) {
        this.picURL = picURL;
    }
}
