package emall.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "T_MERCHANT")
public class Merchant {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name = "merchant_id")
    private int merchantId;

    @Column(name = "merchant_name")
    @NotEmpty(message = "merchant name can not be empty")
    @Length(min = 2, message = "merchant name must more than 2 chars")
    private String merchantName;

    @Column(name = "email")
    @Email
    @NotEmpty(message = "merchant email can not be empty")
    private String email;

    @Column(name = "create_time")
    private Timestamp createTime;

    @Column(name = "is_admin")
    private int isAdmin;

    @Column(name = "pic")
    private String pic;

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

    public int getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(int merchantId) {
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

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }
}
