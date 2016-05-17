package emall.util;

import javax.activation.DataHandler;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.util.ByteArrayDataSource;
import java.io.IOException;
import java.util.Properties;

public class EmailSender {

    // 邮箱账号与密码
    private final String USERNAME = "18683371395@163.com";
    private final String PASSWORD = "Nevergiveup0818";


    // 默认发件人昵称、主题名称、body内容
    public String NICK_NAME = "taurin";
    public String SUBJECT = "随机新密码";
    public String BODY = "默认邮件内容";

    private Properties getConfig() {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.163.com");
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.socketFactory.port", 25);
//        props.put("mail.smtp.ssl.socketFactory", "javax.net.ssl.SSLSocketFactory");
        return props;
    }

    public boolean sendEmail(String to, String subject, String body) {

        if (to == null) {
            return false;
        }
        /**
         * 如果subject或者body为空，那么就使用默认的内容
         */
        if (subject == null) {
            subject = SUBJECT;
        }
        if (body == null) {
            body = BODY;
        }
        Properties props = this.getConfig();
        Session session = Session.getInstance(props,
                new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(USERNAME, PASSWORD);
                    }
                });
        Message message = new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress(USERNAME));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setText(body);
            message.setDataHandler(new DataHandler(
                    new ByteArrayDataSource(body, "text/html")));
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return true;
    }
}
