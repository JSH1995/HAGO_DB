package ajax.command;

import mvc.command.CommandHandler;
import org.json.JSONObject;
import services.LikeService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LikeAjaxHandler implements CommandHandler {

    private LikeService likeService = new LikeService();

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        String type = req.getParameter("type");
        String value = req.getParameter("value");
        System.out.println(type+" value : "+value);
        JSONObject jsonObject = new JSONObject(value);
        int user_no = Integer.parseInt(jsonObject.getString("user_no"));
        int contents_no = Integer.parseInt(jsonObject.getString("contents_no"));
        System.out.println(jsonObject);
        System.out.println("u_no : "+user_no+" con_no : "+contents_no);
        int like_state = likeService.getLikeState(user_no, contents_no);
        switch (type) {
            case "addLike":
                System.out.println("like_state"+like_state);
                if(like_state == 0){
                    /* 현재 Like이 false인 상태 */
                    likeService.addLike(user_no, contents_no);
                    return "true add";
                } else {
                    /* 현재 Like이 되어있는 상태 */
                    //likeService.delLike(user_no, contents_no);
                    return "true del";
                }
            case "delLike":
                System.out.println("like_state"+like_state);
                if(like_state == 0){
                    /* 현재 Like이 false인 상태 */
                    //likeService.addLike(user_no, contents_no);
                    return "true add";
                } else {
                    /* 현재 Like이 되어있는 상태 */
                    likeService.delLike(user_no, contents_no);
                    return "true del";
                }
            default:
                System.out.println("error?");
                return "error";
        }
    }
}
