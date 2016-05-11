package emall.entity;

import javax.persistence.*;

import emall.util.string.JsonDateFormat.NormalDateFormat;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import java.util.Date;


@Entity
@Table(name="T_USER")
public class User {
	@Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name = "user_id", length=32)
	private int userId;
	
	@Column(name = "username")
    @NotEmpty(message = "username can not be empty")
	private String username;

    @Column(name = "password")
    @Length(min=6, message = "password length must more than 6 chars")
    private String password;

    @Column(name = "birthday")
	private Date birthday;

    @Column(name = "gender")
    private String gender;

    @Column(name = "email")
    @NotEmpty(message = "email can not be empty")
    @Email(message = "please input the right email")
    private String email;

    public User(){

    }

    public User(String password, String email) {
        this.password = password;
        this.email = email;
    }



    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @JsonSerialize(using = NormalDateFormat.class)
    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
}
