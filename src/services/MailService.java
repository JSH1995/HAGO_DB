package services;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

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

    private String URL = "https://api.sendgrid.com/v3/mail/send";
    private String CONTENT_TYPE = "application/json";
    private String AUTHORIZATION_TYPE = "Bearer ";
    private String AUTH_KEY = "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";
    private String METHOD_TYPE = "POST";

    private String TITLE = "Hello, Hago Authenticated for you";
    private String FROM = "dlwjdgmlrnt@naver.com";
    private String FORM = "Test Token is ";

    public boolean MailSender(String to, String token) throws JSONException, IOException {
        HttpURLConnection connection = null;
        OutputStreamWriter wr = null;
        try {
            connection = (HttpURLConnection) new URL(URL).openConnection();
            connection.setRequestProperty("Content-Type", CONTENT_TYPE);
            connection.setRequestProperty("Authorization", AUTHORIZATION_TYPE + AUTH_KEY);
            connection.setRequestMethod(METHOD_TYPE);
            connection.setDoOutput(true); // POST 파라미터 전달을 위한 설정
            wr = new OutputStreamWriter(connection.getOutputStream());
            wr.write(MailData(to, token).toString());
            wr.flush();
            System.out.println("Connection Code : " + connection.getResponseCode()
                    + " Connection Response Message : " + connection.getResponseMessage()
                    + " Connection Request Method : " + connection.getRequestMethod());
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            wr.close();
            connection.disconnect();
        }
    }

    public JSONObject MailData(String to, String token) throws JSONException {
        JSONObject data = new JSONObject();
        data.put("personalizations", MailPersonalization(to));
        data.put("from", MailFrom());
        JSONArray content = new JSONArray();
        JSONObject contentObject = new JSONObject();
        contentObject.put("type", "text/plain");
        contentObject.put("value", FORM + token);
        content.put(contentObject);
        data.put("content", content);
        return data;
    }

    public JSONObject MailFrom() throws JSONException {
        JSONObject from = new JSONObject();
        from.put("email", FROM);
        return from;
    }

    public JSONArray MailTo(String to) throws JSONException {
        JSONArray toArray = new JSONArray();
        JSONObject toObject = new JSONObject();
        toObject.put("email", to);
        toArray.put(toObject);
        return toArray;
    }

    public String MailSubject() {
        return TITLE;
    }

    public JSONArray MailPersonalization(String to) throws JSONException {
        JSONArray personalization = new JSONArray();
        JSONObject personalizationObject = new JSONObject();
        personalizationObject.put("to", MailTo(to));
        personalizationObject.put("subject", MailSubject());
        personalization.put(personalizationObject);
        return personalization;
    }

    public boolean MailSenderID(String to, String id) throws IOException {
        HttpURLConnection connection = null;
        OutputStreamWriter wr = null;
        try {
            connection = (HttpURLConnection) new URL(URL).openConnection();
            connection.setRequestProperty("Content-Type", CONTENT_TYPE);
            connection.setRequestProperty("Authorization", AUTHORIZATION_TYPE + AUTH_KEY);
            connection.setRequestMethod(METHOD_TYPE);
            connection.setDoOutput(true); // POST 파라미터 전달을 위한 설정
            wr = new OutputStreamWriter(connection.getOutputStream());
            wr.write(MailDataID(to, id).toString());
            wr.flush();
            System.out.println("Connection Code : " + connection.getResponseCode()
                    + " Connection Response Message : " + connection.getResponseMessage()
                    + " Connection Request Method : " + connection.getRequestMethod());
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            wr.close();
            connection.disconnect();
        }
    }

    public JSONObject MailDataID(String to, String id) throws JSONException {
        TITLE = "Hello, Hago find id for you";
        FORM = "Id is ";
        JSONObject data = new JSONObject();
        data.put("personalizations", MailPersonalization(to));
        data.put("from", MailFrom());
        JSONArray content = new JSONArray();
        JSONObject contentObject = new JSONObject();
        contentObject.put("type", "text/plain");
        contentObject.put("value", FORM + id);
        content.put(contentObject);
        data.put("content", content);
        return data;
    }

    public boolean MailSenderPassword(String to, String password) throws IOException {
        HttpURLConnection connection = null;
        OutputStreamWriter wr = null;
        try {
            connection = (HttpURLConnection) new URL(URL).openConnection();
            connection.setRequestProperty("Content-Type", CONTENT_TYPE);
            connection.setRequestProperty("Authorization", AUTHORIZATION_TYPE + AUTH_KEY);
            connection.setRequestMethod(METHOD_TYPE);
            connection.setDoOutput(true); // POST 파라미터 전달을 위한 설정
            wr = new OutputStreamWriter(connection.getOutputStream());
            wr.write(MailDataPassword(to, password).toString());
            wr.flush();
            System.out.println("Connection Code : " + connection.getResponseCode()
                    + " Connection Response Message : " + connection.getResponseMessage()
                    + " Connection Request Method : " + connection.getRequestMethod());
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            wr.close();
            connection.disconnect();
        }
    }

    public JSONObject MailDataPassword(String to, String password) throws JSONException {
        TITLE = "Hello, Hago find password for you";
        FORM = "Password is ";
        JSONObject data = new JSONObject();
        data.put("personalizations", MailPersonalization(to));
        data.put("from", MailFrom());
        JSONArray content = new JSONArray();
        JSONObject contentObject = new JSONObject();
        contentObject.put("type", "text/plain");
        contentObject.put("value", FORM + password);
        content.put(contentObject);
        data.put("content", content);
        return data;
    }
}
