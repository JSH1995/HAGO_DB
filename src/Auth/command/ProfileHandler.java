package Auth.command;

import models.Content;
import models.ProfileContents;
import models.User;
import mvc.command.CommandHandler;
import services.AuthService;
import services.ContentService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class ProfileHandler implements CommandHandler {
    private static String FORM_VIEW = "/WEB-INF/view/Auth/profile.jsp";
    private static String ERROR_VIEW = "/WEB-INF/view/error/error_500.jsp";
    private static String BEFORE_VIEW = "/WEB-INF/view/Auth/profile_confirm.jsp";

    private AuthService authService = new AuthService();
    private ContentService contentService = new ContentService();

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
        String id = (String) req.getSession().getAttribute("USER");
        User user = authService.getUser(id);
        req.setAttribute("user", user);
        ArrayList<Content> recents = contentService.getRecentContents(user.getNo());
        ArrayList<Content> edits = contentService.getEditContents(user.getNo());
        ArrayList<Content> shares = contentService.getShareContents(user.getNo());
        ArrayList<Content> likes = contentService.getLikeContents(user.getNo());
        ProfileContents profileContents = new ProfileContents(recents, edits, shares, likes);
        req.setAttribute("profile", profileContents);
        return FORM_VIEW;
    }

    private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
        String id = (String) req.getSession().getAttribute("USER");
        User user = authService.getUser(id);
        req.setAttribute("user", user);
        ArrayList<Content> recents = contentService.getRecentContents(user.getNo());
        ArrayList<Content> edits = contentService.getEditContents(user.getNo());
        ArrayList<Content> shares = contentService.getShareContents(user.getNo());
        ArrayList<Content> likes = contentService.getLikeContents(user.getNo());
        ProfileContents profileContents = new ProfileContents(recents, edits, shares, likes);
        req.setAttribute("profile", profileContents);
        return FORM_VIEW;
    }
}
