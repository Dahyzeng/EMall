package emall.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by taurinzeng on 2016/3/25.
 */
@Entity
@Table(name = "T_USER_LOG")
public class UserLog {

    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name = "system-uuid",strategy="uuid")
    @Column(name = "log_id")
    private String logId;

    @Column(name = "username")
    private String username;

    @Column(name = "operation")
    private String operation;

    @Temporal(TemporalType.DATE)
    @Column(name = "operation_date")
    private Date operationDate;

    public UserLog() {
    }

    public String getLogId() {
        return logId;
    }

    public void setLogId(String logId) {
        this.logId = logId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public Date getOperationDate() {
        return operationDate;
    }

    public void setOperationDate(Date operationDate) {
        this.operationDate = operationDate;
    }
}
