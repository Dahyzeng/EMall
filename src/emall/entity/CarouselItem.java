package emall.entity;

/**
 * Created by taurinzeng on 2016/3/25.
 */
public class CarouselItem {
    private String ItemId;
    private String picURL;
    private int sequence;

    public CarouselItem() {
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
