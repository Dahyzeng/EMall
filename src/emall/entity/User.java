package emall.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Min;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;


@Entity
@Table(name="USER")
public class User {

	@Id
	@GeneratedValue(generator="system-uuid")
	@GenericGenerator(name = "system-uuid",strategy="uuid")
	@Column(name = "UserId", length=32)
	private String userId;
	
	@Column(name = "Username")
    @NotEmpty(message = "username can not be empty")
	private String username;

    @Column(name = "Password")
    @Length(min=6, message = "password length must more than 6 chars")
    private String password;

    @Column(name = "Age")
    @Min(value = 0,message = "age can not less than 0")
	private int age;

    @Column(name = "Gender")
    private String gender;

    @Column(name = "Telephone")
    @NotEmpty(message = "telephone can not be empty")
    @Length(min = 11, max = 11, message = "telephone should be 11 chars")
    private String telephone;

    @Column(name = "Email")
    @NotEmpty(message = "email can not be empty")
    @Email(message = "please input the right email")
    private String email;

    public User(){

    }

    public User(String userId,String username, String password, int age, String gender, String telephone, String email) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.age = age;
        this.gender = gender;
        this.telephone = telephone;
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
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

}
