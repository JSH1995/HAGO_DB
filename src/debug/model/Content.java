package debug.model;

import java.util.Date;

public class Content {
    private int no;
    private String category;
    private String state;
    private String name;
    private String title;
    private String detail;
    private Date date;
    private String contents;
    private User user;
    private ConDetail conDetail;

    public Content(int no, String category, String state, String name, String title, String detail, Date date, String contents, User user, ConDetail conDetail) {
        this.no = no;
        this.category = category;
        this.state = state;
        this.name = name;
        this.title = title;
        this.detail = detail;
        this.date = date;
        this.contents = contents;
        this.user = user;
        this.conDetail = conDetail;
    }

    @Override
    public String toString() {
        return "Content{" +
                "no=" + no +
                ", category='" + category + '\'' +
                ", state='" + state + '\'' +
                ", name='" + name + '\'' +
                ", title='" + title + '\'' +
                ", detail='" + detail + '\'' +
                ", date=" + date +
                ", contents='" + contents + '\'' +
                ", user=" + user +
                ", conDetail=" + conDetail +
                '}';
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public ConDetail getConDetail() {
        return conDetail;
    }

    public void setConDetail(ConDetail conDetail) {
        this.conDetail = conDetail;
    }
}
