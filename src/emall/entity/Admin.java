package emall.entity;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

@Entity
@Table(name = "ADMIN")
public class Admin {
    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name = "system-uuid",strategy="uuid")
    @Column(name = "UserId")
    private String userId;

    @Column(name = "AdminName")
    @NotEmpty(message = "admin name can not be empty")
    @Length(min = 2, message = "admin must more than 2 chars")
    private String adminName;

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

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
