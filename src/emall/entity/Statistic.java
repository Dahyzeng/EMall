package emall.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by taurin on 2016/5/18.
 */
@Entity
@Table(name = "T_STATISTIC")
public class Statistic {
    @Id
    @GeneratedValue(generator = "ud")
    @GenericGenerator(name = "ud", strategy = "assigned")
    @Column(name = "id")
    private int id;

    @Column(name = "total_finished_order")
    private int totalFinishedOrder;

    @Column(name = "sales")
    private float sales;

    @Column(name = "users")
    private int users;

    @Column(name = "items")
    private int items;

    public int getTotalFinishedOrder() {
        return totalFinishedOrder;
    }

    public void setTotalFinishedOrder(int totalFinishedOrder) {
        this.totalFinishedOrder = totalFinishedOrder;
    }

    public float getSales() {
        return sales;
    }

    public void setSales(float sales) {
        this.sales = sales;
    }

    public int getUsers() {
        return users;
    }

    public void setUsers(int users) {
        this.users = users;
    }

    public int getItems() {
        return items;
    }

    public void setItems(int items) {
        this.items = items;
    }
}
