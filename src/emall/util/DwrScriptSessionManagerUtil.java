package emall.util;

import org.directwebremoting.*;
import org.directwebremoting.servlet.DwrServlet;

/**
 * Created by taurin on 2016/5/31.
 */
public class DwrScriptSessionManagerUtil extends DwrServlet {

    public static ScriptRunnable scriptRunnable = new ScriptRunnable();

    public static void sendMessageAuto(Object message) {
//        final String userId = userid ;
        scriptRunnable.setMessge(message.toString());
        Browser.withAllSessionsFiltered(new ScriptSessionFilter() {
            public boolean match(ScriptSession session) {
//                if (session.getAttribute("userId") == null)
//                    return false;
//                else
//                    return (session.getAttribute("userId")).equals(userId);
                return true;
            }
        }, scriptRunnable);
    }
}
