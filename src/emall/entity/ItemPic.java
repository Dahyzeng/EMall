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
    @Column(name = "item_id")
    private int itemId;

    @Id
    @Column(name = "pic_url")
    private String picURL;



    public ItemPic() {
    }

    public ItemPic(int itemId, String picURL) {
        this.itemId = itemId;
        this.picURL = picURL;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public String getPicURL() {
        return picURL;
    }

    public void setPicURL(String picURL) {
        this.picURL = picURL;
    }
}
