package emall.entity;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by Taurin on 2015/12/8.
 */
@Entity
@Table(name="T_USER_ADDRESS")
public class Address {
    @Id
    @Column(name = "address_id")
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name = "system-uuid",strategy="uuid")
    private String addressId;

    @Column(name = "user_id")
    private String userId;

    @Column(name = "address_content")
    private String addressContent;

    public Address() {
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

    public String getAddressContent() {
        return addressContent;
    }

    public void setAddressContent(String addressContent) {
        this.addressContent = addressContent;
    }
}
