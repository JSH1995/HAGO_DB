package debug.model;

import java.util.Date;

public class Announce {
    private int no;
    private String title;
    private String detail;
    private Date date;

    public Announce(int no, String title, String detail, Date date) {
        this.no = no;
        this.title = title;
        this.detail = detail;
        this.date = date;
    }

    @Override
    public String toString() {
        return "Announce{" +
                "no=" + no +
                ", title='" + title + '\'' +
                ", detail='" + detail + '\'' +
                ", date=" + date +
                '}';
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
