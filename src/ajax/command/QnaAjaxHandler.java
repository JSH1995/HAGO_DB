package ajax.command;

import models.CustomCenter;
import mvc.command.CommandHandler;
import org.json.JSONArray;
import org.json.JSONObject;
import services.QnaService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class QnaAjaxHandler implements CommandHandler {
    private QnaService quaService = new QnaService();
    private ArrayList<CustomCenter> myQna = new ArrayList<>();

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        // 눌려서 curpage 들어옴.
        int id = Integer.parseInt(req.getParameter("id"));
        // 0 = false , 1 = true
        int first = 0;
        int last = 0;

        myQna = quaService.QnaDB(id);
        int totalCount = quaService.QnaTotalCnt();

        int totalPage = (int)Math.floor(totalCount/5); // 전체 게시물 / 보여줄 게시물
        if(totalCount % 5 > 0){
            totalPage++; // 전체 페이지 수
        }
        int startPage = -1; // 1
        int curPage = -1; // 2
        int endPage = -1; // 3
        // page 구하고 페이지 세팅중.
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


        for(int i =0 ;i<myQna.size();i++)
        {
            JSONObject detail = new JSONObject();
            detail.put("No",myQna.get(i).getNo());
            detail.put("Question",myQna.get(i).getQuestion());
            detail.put("Qna_Date",myQna.get(i).getDate());
            detail.put("Answer",myQna.get(i).getAnswer());
            jsonArray.put(detail);
        }
        jsonObject.put("my_Qna", jsonArray);
        jsonObject.put("qna_TotalPage",totalPage);
        System.out.println(jsonObject.toString());
        return jsonObject.toString();
    }
}
