package emall.entity;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

@Entity
@Table(name = "T_MERCHANT")
public class Merchant {
    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name = "system-uuid",strategy="uuid")
    @Column(name = "merchant_id")
    private String merchantId;

    @Column(name = "merchant_name")
    @NotEmpty(message = "merchant name can not be empty")
    @Length(min = 2, message = "merchant name must more than 2 chars")
    private String merchantName;

    @Column(name = "email")
    @Email
    @NotEmpty(message = "merchant email can not be empty")
    private String email;

    @Column(name = "password")
    @NotEmpty
    @Length(min = 6, message = "password must more than 6 chars")
    private String password;

    public Merchant() {
    }

    public Merchant(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public String getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(String merchantId) {
        this.merchantId = merchantId;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
