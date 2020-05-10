package ajax.command;

import models.Announce;
import mvc.command.CommandHandler;
import org.json.JSONArray;
import org.json.JSONObject;
import services.NoticeService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class NoticeAjaxHandler implements CommandHandler {
    private NoticeService noticeService = new NoticeService();
    private ArrayList<Announce> myNotice = new ArrayList<>();


    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        int id = Integer.parseInt(req.getParameter("id"));
        int first = 0;
        int last = 0;

        int viewValue = 5;

        // TO DO
        // noticeDB -> id add
        myNotice = noticeService.NoticeDB(id,viewValue);

        int totalCount = noticeService.NoticeTotalCnt();

        int totalPage = (int)Math.floor(totalCount/viewValue);
        if(totalCount % viewValue > 0){
            totalPage++;
        }
        int startPage = -1;
        int curPage = -1;
        int endPage = -1;

        if(totalPage < 4) {
            System.out.println("before4");
            switch (totalPage){
                case 0:
                    return "error";
                case 1:
                    startPage = 1;
                    curPage = -1;
                    endPage = -1;
                    break;
                case 2:
                    startPage = 1;
                    curPage = 2;
                    endPage = -1;
                    break;
                case 3:
                    startPage = 1;
                    curPage = 2;
                    endPage = 3;
                    break;
            }
            System.out.println(id);
            if(id == 0) first = 1;
            if(id == (totalPage-1)) last = 1;
            if(id != 0 && id != (totalPage-1)) {
                first = 0;
                last = 0;
            }
        } else { // totalpage 가 3개 이상
            System.out.println("after4");
            if(id < 2) // 1페이지, 2페이지 일 경우
            {

                first = 0;
                last = 0;
                startPage = 1;
                curPage = 2;
                endPage = 3;
                if(id == 0) first = 1;
                System.out.println("zero sec"+startPage+curPage+endPage);
            }
            else if( (id+2) > totalPage ) // lastpage
            {
                System.out.println("핑"+id);
                last = 1;
                startPage = totalPage-2;
                curPage = totalPage-1;
                endPage = totalPage;
                System.out.println("d sec"+startPage+curPage+endPage);
            }
            else if( (id+2) <= totalPage ) // 중간 페이지
            {

                first = 0;
                last = 0;
                startPage = id;
                curPage = id+1;
                endPage = id+2;
                System.out.println("f sec"+startPage+curPage+endPage);
            }
            else {
                System.out.println("ero");
            }
        }
        jsonObject.put("first",first);
        jsonObject.put("last",last);
        jsonObject.put("startPage",startPage);
        jsonObject.put("curPage",curPage);
        jsonObject.put("endPage",endPage);


        for(int i =0 ;i<myNotice.size();i++)
        {
            JSONObject detail = new JSONObject();
            detail.put("No",myNotice.get(i).getNo());
            detail.put("Title",myNotice.get(i).getTitle());
            detail.put("Notice_Date",myNotice.get(i).getDate());
            detail.put("Detail",myNotice.get(i).getDetail());
            jsonArray.put(detail);
        }
        jsonObject.put("my_Notice", jsonArray);
        jsonObject.put("notice_TotalPage",totalPage);
        System.out.println(jsonObject.toString());
        return jsonObject.toString();
    }
}
