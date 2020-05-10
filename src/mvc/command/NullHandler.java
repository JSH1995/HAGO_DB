package mvc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NullHandler implements CommandHandler{

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception{
        System.out.println(res.getStatus());
        res.sendError(HttpServletResponse.SC_NOT_FOUND);
        return null;
    }
}
