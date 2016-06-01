package emall.util;

import org.directwebremoting.ScriptBuffer;
import org.directwebremoting.ScriptSession;

import java.util.Collection;

/**
 * Created by taurin on 2016/5/31.
 */
public class ScriptRunnable implements Runnable {
    private ScriptBuffer script;
    private String messge;
    public ScriptRunnable() {
       script = new ScriptBuffer();
    }
    public void run() {
        script.appendCall("prompt", messge);
        Collection<ScriptSession> sessions = ScriptSessionImp.getScriptSession();
        for (ScriptSession scriptSession : sessions) {
            scriptSession.addScript(script);
        }
    }

    public String getMessge() {
        return messge;
    }

    public void setMessge(String messge) {
        this.messge = messge;
    }
}
