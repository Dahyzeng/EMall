package emall.util;

import org.directwebremoting.impl.DefaultScriptSessionManager;
import org.springframework.stereotype.Component;

/**
 * Created by taurin on 2016/5/31.
 */
@Component
public class DWRScriptSessionManager extends DefaultScriptSessionManager {
    public DWRScriptSessionManager () {
        System.out.println("binding scriptSession");
        this.addScriptSessionListener(new ScriptSessionImp());
    }
}
