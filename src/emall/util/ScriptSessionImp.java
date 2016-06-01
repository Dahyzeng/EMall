package emall.util;

import org.directwebremoting.ScriptSession;
import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import org.directwebremoting.event.ScriptSessionEvent;
import org.directwebremoting.event.ScriptSessionListener;

import javax.servlet.http.HttpSession;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by taurin on 2016/5/31.
 */
public class ScriptSessionImp implements ScriptSessionListener {
    public static final Map<String, ScriptSession> scriptSessionMap = new HashMap<String, ScriptSession>();
    public void sessionCreated(ScriptSessionEvent ev) {
        WebContext webContext = WebContextFactory.get();
        HttpSession session = webContext.getSession();
        ScriptSession scriptSession = ev.getSession();
        scriptSessionMap.put(session.getId(), scriptSession);
    }

    public void sessionDestroyed(ScriptSessionEvent ev) {
        WebContext webContext = WebContextFactory.get();
        HttpSession session = webContext.getSession();
        scriptSessionMap.remove(session.getId());
        System.out.println("a ScriptSession is distroyed");
    }

    public static Collection<ScriptSession> getScriptSession() {
        return scriptSessionMap.values();
    }
}
