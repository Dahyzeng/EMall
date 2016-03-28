package emall.entity.PK;

/**
 * Created by taurinzeng on 2016/3/28.
 */
public class AddressPK {
    private String addressId;
    private String userId;

    public AddressPK() {
    }

    @Override
    public boolean equals(Object obj) {
        if(this == obj) return true;
        if(obj == null) return false;
        if(!(obj instanceof AddressPK)) return false;
        AddressPK objKey = (AddressPK)obj;
        return addressId.equalsIgnoreCase(objKey.addressId) && userId.equalsIgnoreCase(objKey.userId);
    }

    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((addressId== null) ? 0 : addressId.hashCode());
        result = PRIME * result + ((userId == null) ? 0 : userId.hashCode());
        return result;
    }

    public String getAddressId() {
        return addressId;
    }

    public void setAddressId(String addressId) {
        this.addressId = addressId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
