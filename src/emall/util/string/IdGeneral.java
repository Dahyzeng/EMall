package emall.util.string;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * Created by taurin on 2016/5/12.
 */
public class IdGeneral {
    public static String primaryKey() {
        SimpleDateFormat keyFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        return "o" + keyFormat.format(new Date()) + new Random().nextInt(30);
    }
}
