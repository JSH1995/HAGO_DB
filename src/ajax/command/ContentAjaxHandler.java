package ajax.command;

import mvc.command.CommandHandler;
import services.ContentService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContentAjaxHandler implements CommandHandler {

    private ContentService contentService = new ContentService();

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        String type = req.getParameter("type");
        String value = req.getParameter("value");
        return executor(req, type, value);
    }

    private String executor(HttpServletRequest req, String type, String value) throws Exception {
        switch (type) {
            case "edit":
            case "share":
                if (contentService.updateContent(type, Integer.parseInt(value))) {
                    return "true";
                } else {
                    return "false";
                }
            default:
                return null;
        }
    }
}
