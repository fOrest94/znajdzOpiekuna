package info.znOpk.authentication;

import info.znOpk.model.User;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

@Component
public class EmailAuthentication {

    public void generateAndSendEmail(User user) throws AddressException, MessagingException {

        final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        Properties props = System.getProperties();
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.port", "465");
        props.setProperty("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.auth", "true");
        props.put("mail.debug", "true");
        props.put("mail.store.protocol", "pop3");
        props.put("mail.transport.protocol", "smtp");
        final String username = "znajdzopiekuna@gmail.com";//
        final String password = "posolene";

        try {

            Session session = Session.getDefaultInstance(props,
                    new Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(username, password);
                        }
                    });

            Message msg = new MimeMessage(session);
            msg.setContent("<h3>Witaj, " + user.getFirstName() + " " + user.getLastName() + "<h3>" +
                    "<a href=\"http://localhost:8080/\">Kliknij tutaj aby aktywować swoje konto</a><br><br>Pozdrawiamy,<br>Zespół, <p style=\"color:#FF4F4F;\">znajdźOpiekuna</p>", "text/html; charset=utf-8");
            msg.setFrom(new InternetAddress("aboutabreast@gmail.com"));
            msg.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(user.getUsername(), false));
            msg.setSubject(user.getFirstName() + ", aktywuj swoje konto!");
            msg.setSentDate(new Date());
            Transport.send(msg);
            System.out.println("Message sent.");
        } catch (MessagingException e) {
            System.out.println("Wystąpił błąd: " + e);
        }
    }
}