package emall.entity;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by Taurin on 2015/12/8.
 */
@Entity
@Table(name="USER_ADDRESS")
public class Address {
    @Id
    @Column(name = "AddressId")
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name = "system-uuid",strategy="uuid")
    private String addressId;

    @Id
    @Column(name = "UserId")
    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "UserId", referencedColumnName = "UserId")
    private User user;

    @Column(name = "AddressContent")
    private String addressContent;


    public String getAddressId() {
        return addressId;
    }

    public void setAddressId(String addressId) {
        this.addressId = addressId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getAddressContent() {
        return addressContent;
    }

    public void setAddressContent(String addressContent) {
        this.addressContent = addressContent;
    }
}
