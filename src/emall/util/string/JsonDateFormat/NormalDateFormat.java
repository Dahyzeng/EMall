package emall.util.string.JsonDateFormat;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by taurin on 2016/5/10.
 */
public class NormalDateFormat extends JsonSerializer<Date> {
    private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    @Override
    public void serialize(Date date, JsonGenerator gen, SerializerProvider provider)  throws IOException, JsonProcessingException {
        String value = dateFormat.format(date);
        gen.writeString(value);
    }
}