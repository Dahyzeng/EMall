package emall.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by taurin on 2016/5/19.
 */
@Entity
@Table(name = "T_EXPRESS_INFO")
public class ExpressInfo {
    @Id
    @GeneratedValue(generator = "ud")
    @GenericGenerator(name = "ud", strategy = "assigned")
    @Column(name = "order_id")
    private String orderId;

    @Column(name = "express_name")
    private String expressName;

    @Column(name = "express_number")
    private String expressNumber;

    public ExpressInfo() {
    }

    public ExpressInfo(String orderId, String expressName, String expressNumber) {
        this.orderId = orderId;
        this.expressName = expressName;
        this.expressNumber = expressNumber;
    }

    public String getExpressName() {
        return expressName;
    }

    public void setExpressName(String expressName) {
        this.expressName = expressName;
    }

    public String getExpressNumber() {
        return expressNumber;
    }

    public void setExpressNumber(String expressNumber) {
        this.expressNumber = expressNumber;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }
}
