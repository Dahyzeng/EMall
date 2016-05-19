package emall.util.string.constants;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by taurin on 2016/5/16.
 */
public class MapConstant {
    public static final Map<Integer, String> ORDER_STATUS_MAP = new HashMap<Integer, String>() {
        {
            put(-2, "Non-payment");
            put(-1, "Canceled");
            put(0, "Unconfirmed");
            put(1, "Confirmed");
            put(2, "Delivered ");
            put(3, "Finished");
            put(5, "Deleted");
        }
    };
}
