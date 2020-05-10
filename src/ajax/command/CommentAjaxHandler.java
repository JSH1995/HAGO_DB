package ajax.command;

import models.Comment;
import mvc.command.CommandHandler;
import org.json.JSONObject;
import services.CommentService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommentAjaxHandler implements CommandHandler {

    private CommentService commentService = new CommentService();

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        String type = req.getParameter("type");
        String value = req.getParameter("value");
        System.out.println(type + " value : " + value);
        return executor(req, type, value);
    }

    private String executor(HttpServletRequest req, String type, String value) throws Exception {
        switch (type) {
            case "addComment":
                JSONObject jsonObject = new JSONObject(value);
                int comment_no = commentService.addComment(jsonObject.getInt("user_no"), jsonObject.getInt("contents_no"), jsonObject.getString("comment"));
                if (comment_no == 0) {
                    return "false";
                } else {
                    return "true";
                }
            default:
                return null;
        }
    }
}
