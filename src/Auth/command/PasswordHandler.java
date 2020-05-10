package Auth.command;

import mvc.command.CommandHandler;
import services.AuthService;
import services.MailService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PasswordHandler implements CommandHandler {
    private static String FORM_VIEW = "/WEB-INF/view/Auth/password_search.jsp";

    private AuthService authService = new AuthService();
    private MailService mailService = new MailService();

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        if (req.getMethod().equalsIgnoreCase("GET")) {
            return processForm(req, res);
        } else if (req.getMethod().equalsIgnoreCase("POST")) {
            return processSubmit(req, res);
        } else {
            res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return null;
        }
    }

    private String processForm(HttpServletRequest req, HttpServletResponse res) {
        return FORM_VIEW;
    }

    private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String id = req.getParameter("inputId");
        String email = req.getParameter("inputEmail");
        String password = authService.findPassword(id, email);
        if (password != null) {
            System.out.println("password Handler"+password);
            if (mailService.MailSenderPassword(email, password)) {
                req.setAttribute("state", 1);
            } else {
                req.setAttribute("state", 3);
            }
        } else {
            req.setAttribute("state", 2);
        }
        return FORM_VIEW;
    }
}
