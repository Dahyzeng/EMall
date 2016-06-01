package emall.entity;

import javax.persistence.*;

/**
 * Created by taurin on 2016/5/31.
 */
@Entity
@Table(name = "T_MALL_INFO")
public class MallInfo {
    @Id
    @Column(name = "address_id")
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int id;
    @Column(name = "name")
    private String name;
    @Column(name = "email")
    private String email;
    @Column(name = "telephone")
    private String telephone;
    @Column(name = "store_pic_url")
    private String storePicURL;
    @Column(name = "cell_phone")
    private String cellPhone;
    @Column(name = "address")
    private String address;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getStorePicURL() {
        return storePicURL;
    }

    public void setStorePicURL(String storePicURL) {
        this.storePicURL = storePicURL;
    }

    public String getCellPhone() {
        return cellPhone;
    }

    public void setCellPhone(String cellPhone) {
        this.cellPhone = cellPhone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
