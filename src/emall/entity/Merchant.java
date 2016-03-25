package emall.entity;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

@Entity
@Table(name = "MERCHANT")
public class Merchant {
    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name = "system-uuid",strategy="uuid")
    @Column(name = "UserId")
    private String userId;

    @Column(name = "MerchantName")
    @NotEmpty(message = "merchant name can not be empty")
    @Length(min = 2, message = "merchant name must more than 2 chars")
    private String merchantName;

    @Column(name = "Password")
    @NotEmpty(message = "password can not be empty")
    @Length(min = 6, message = "password must more than 6 chars")
    private String password;


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
