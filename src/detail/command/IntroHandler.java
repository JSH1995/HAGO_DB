package detail.command;

import models.AdminManage;
import mvc.command.CommandHandler;
import services.AdminService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class IntroHandler implements CommandHandler {
    private static String FORM_VIEW = "/WEB-INF/view/detail/intro.jsp";

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
        /*AdminManage adminManages = new AdminService().adminDB();
        if (adminManages == null) {
            adminManages = new AdminManage();
        }
        req.setAttribute("admin", adminManages);*/

        return FORM_VIEW;
    }

    private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
        return FORM_VIEW;
    }
}
