package debug.model;

import java.sql.Timestamp;
import java.util.Date;

public class CustomCenter {
    private int no;
    private String question;
    private String answer;
    private Date date;

    public CustomCenter(int no, String question, String answer, Date date) {
        this.no = no;
        this.question = question;
        this.answer = answer;
        this.date = date;
    }


    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "CustomCenter{" +
                "no=" + no +
                ", question=" + question +
                ", answer=" + answer +
                ", date=" + date +
                '}';
    }
}
