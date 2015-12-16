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

    @Column(name = "Username")
    @NotEmpty(message = "username can not be empty")
    @Length(min = 2, message = "username must more than 2 chars")
    private String username;

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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
