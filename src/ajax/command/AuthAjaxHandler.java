package ajax.command;

import mvc.command.CommandHandler;
import org.json.JSONObject;
import services.AuthService;
import services.MailService;
import util.Tokens;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthAjaxHandler implements CommandHandler {

    private AuthService authService = new AuthService();

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        System.out.println("0");
        String type = req.getParameter("type");
        String value = req.getParameter("value");
        System.out.println(type);
        return executor(req, type, value);
    }

    private String executor(HttpServletRequest req, String type, String value) throws Exception {
        switch (type) {
            case "logout":
                switch (authService.logoutService(req.getSession())) {
                    case 1:
                        return "true";
                    case 2:
                        return "false";
                    case 3:
                        return "error";
                    default:
                        return null;
                }
            case "duplicatedId":
                System.out.println("dup id : " + authService.duplicatedId(value));
                switch (authService.duplicatedId(value)) {
                    case 1:
                        return "true";
                    case 2:
                        return "false";
                    case 3:
                        return "error";
                    default:
                        return null;
                }
            case "duplicatedMailAuth":
                String token = null;
                JSONObject jsonObject = new JSONObject(value);
                //if (authService.integrity(jsonObject.getString("id"), jsonObject.getString("email"))) {
                if (authService.duplicatedMail(jsonObject.getString("email")) == 1) {
                    token = Tokens.randomToken(12);
                    if (authService.saveTempToken(jsonObject.getString("email"), token) && new MailService().MailSender(jsonObject.getString("email"), token)) {
                        return "true";
                    } else {
                        return "error";
                    }
                } else {
                    return "false";
                }
            case "profileeditMail":
                token = null;
                jsonObject = new JSONObject(value);
                token = Tokens.randomToken(12);
                if (authService.saveTempToken(jsonObject.getString("email"), token) && new MailService().MailSender(jsonObject.getString("email"), token)) {
                    return "true";
                } else {
                    return "error";
                }
            case "duplicatedMail":
                jsonObject = new JSONObject(value);
                switch (authService.duplicatedMail(jsonObject.getString("email"))) {
                    case 1:
                        token = Tokens.randomToken(12);
                        if (authService.saveTempToken(jsonObject.getString("email"), token) && new MailService().MailSender(jsonObject.getString("email"), token)) {
                            return "true";
                        } else {
                            return "error";
                        }
                    case 2:
                        return "false";
                    case 3:
                        return "error";
                    default:
                        return null;
                }
            case "CheckMailAuth":
            case "CheckMail":
                jsonObject = new JSONObject(value);
                System.out.println("check Vlaue : " +authService.duplicatedMail(jsonObject.getString("email")));
                switch (authService.duplicatedMail(jsonObject.getString("email"))) {
                    case 1:
                        return "true";
                    case 2:
                        return "false";
                    case 3:
                        return "error";
                    default:
                        return null;
                }
            default:
                return null;
        }
    }
}
