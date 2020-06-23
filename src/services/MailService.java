package services;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailService {
    /*MailSending Algorithm
     * 1. Create Personal Token
     * 2. Token Database Insert
     * 3. Mail Sending
     * 4. return Success or Failed*/
    /*try {
            TODO Create Personal Token
            TODO Token Database Insert
            new MailService().MailSender();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return FORM_VIEW;
        }*/

    /*회원가입 메일 제목*/
    private String TITLE = "Hello, Hago Authenticated for you";
    /*비밀번호 찾기 메일 내용*/
    private String FORM = "Authenticated Token is ";

    /*비밀번호 찾기 메일 제목*/
    private String Find_PASSWORD_TITLE = "Hello, Hago find password for you";
    /*비밀번호 찾기 메일 내용*/
    private String Find_PASSWORD_FORM = "Your password is ";

    /*아이디 찾기 메일 제목*/
    private String Find_ID_TITLE = "Hello, Hago find id for you";
    /*아이디 찾기 메일 제목*/
    private String Find_ID_FORM = "Your id is ";

    public boolean naverMailSend(String to, String token) {
        String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
        String user = "codinghago@naver.com"; // 패스워드
        String password = "1q2w3e4r!@";      // SMTP 서버 정보를 설정한다.
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 587);
        props.put("mail.smtp.auth", "true");
        Session session = Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            // 메일 제목
            message.setSubject(TITLE);
            // 메일 내용
            message.setText(FORM + token);
            // send the message
            Transport.send(message);
            System.out.println("Success Message Send");
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    /*ID 찾기 보내기*/
    public boolean naverMailSendID(String to, String id) {
        String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
        String user = "codinghago@naver.com"; // 패스워드
        String password = "1q2w3e4r!@";      // SMTP 서버 정보를 설정한다.
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 587);
        props.put("mail.smtp.auth", "true");
        Session session = Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            // 메일 제목
            message.setSubject(Find_ID_TITLE);
            // 메일 내용
            message.setText(Find_ID_FORM + id);
            // send the message
            Transport.send(message);
            System.out.println("Success Message Send");
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    /*PASSWORD 찾기 보내기*/
    public boolean naverMailSendPass(String to, String pass) {
        String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
        String user = "codinghago@naver.com"; // 패스워드
        String password = "1q2w3e4r!@";      // SMTP 서버 정보를 설정한다.
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 587);
        props.put("mail.smtp.auth", "true");
        Session session = Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            // 메일 제목
            message.setSubject(Find_PASSWORD_TITLE);
            // 메일 내용
            message.setText(Find_PASSWORD_FORM + pass);
            // send the message
            Transport.send(message);
            System.out.println("Success Message Send");
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean MailSender(String to, String token) throws JSONException, IOException, MessagingException {
        return naverMailSend(to, token);
    }

    public boolean MailSenderID(String to, String id) throws IOException {
        return naverMailSendID(to, id);
    }

    public boolean MailSenderPassword(String to, String password) throws IOException {
        return naverMailSendPass(to, password);
    }
}
