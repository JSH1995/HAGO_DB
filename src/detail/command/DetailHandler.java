package detail.command;

import models.Comment;
import models.Content;
import models.User;
import mvc.command.CommandHandler;
import services.AuthService;
import services.CommentService;
import services.ContentService;
import services.LikeService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;

public class DetailHandler implements CommandHandler {

    private static String FORM_VIEW = "/WEB-INF/view/detail/detail.jsp";
    private static String ERROR_VIEW = "/WEB-INF/view/error/error_500.jsp";
    private AuthService authService = new AuthService();
    private ContentService contentService = new ContentService();
    private CommentService commentService = new CommentService();

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

    private String processForm(HttpServletRequest req, HttpServletResponse res) throws SQLException {
        String id = (String) req.getSession().getAttribute("USER");
        User user = authService.getUser(id);
        req.setAttribute("user", user);
        int content_no = Integer.parseInt(req.getParameter("content_no"));
        Content content = contentService.getContent(content_no);
        req.setAttribute("content", content);
        int likeCount = new LikeService().getLikeCount(content_no);
        req.setAttribute("likeCount", likeCount);
        System.out.println("like Count : " + likeCount);
        ArrayList<Comment> comments = commentService.getComments(content_no);
        req.setAttribute("comments", comments);
        System.out.println("User GeT settion" + user);
        if (content.getState().equals("edit")) {
            return ERROR_VIEW;
        }
        return FORM_VIEW;
    }

    private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws SQLException {
        String id = (String) req.getSession().getAttribute("USER");
        User user = authService.getUser(id);
        req.setAttribute("user", user);
        int content_no = Integer.parseInt(req.getParameter("content_no"));
        Content content = contentService.getContent(content_no);
        req.setAttribute("content", content);
        int likeCount = new LikeService().getLikeCount(content_no);
        req.setAttribute("likeCount", likeCount);
        System.out.println("like Count : " + likeCount);
        ArrayList<Comment> comments = commentService.getComments(content_no);
        req.setAttribute("comments", comments);
        System.out.println("User post settion" + id);
        if (content.getState().equals("edit")) {
            return ERROR_VIEW;
        }
        return FORM_VIEW;
    }
}
