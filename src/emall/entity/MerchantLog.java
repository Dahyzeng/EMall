package emall.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import emall.util.string.JsonDateFormat.DetailDateFormat;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by taurinzeng on 2015/12/21.
 */
@Entity
@Table(name = "T_MERCHANT_LOG")
public class MerchantLog {
    @Id
    @Column(name = "log_id")
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int logId;

    @Column(name = "merchant_name")
    private String merchantName;

    @Column(name = "operation")
    private String operation;

    @Column(name = "date")
    private Timestamp date;

    public MerchantLog() {
    }

    public MerchantLog(String merchantName, String operation, Timestamp date) {
        this.merchantName = merchantName;
        this.operation = operation;
        this.date = date;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public int getLogId() {
        return logId;
    }

    public void setLogId(int logId) {
        this.logId = logId;
    }

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
}
