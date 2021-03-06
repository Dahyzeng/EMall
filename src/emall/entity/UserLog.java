package emall.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import emall.util.string.JsonDateFormat.DetailDateFormat;
import emall.util.string.JsonDateFormat.NormalDateFormat;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by taurinzeng on 2016/3/25.
 */
@Entity
@Table(name = "T_USER_LOG")
public class UserLog {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name = "log_id")
    private int logId;

    @Column(name = "username")
    private String username;

    @Column(name = "operation")
    private String operation;

    @Column(name = "operation_date")
    private Timestamp operationDate;

    public UserLog() {
    }

    public int getLogId() {
        return logId;
    }

    public void setLogId(int logId) {
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

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")

    public Timestamp getOperationDate() {
        return operationDate;
    }

    public void setOperationDate(Timestamp operationDate) {
        this.operationDate = operationDate;
    }
}
