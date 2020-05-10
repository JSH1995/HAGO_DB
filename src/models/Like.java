package models;

public class Like {
    private User user;
    private Content content;
    private int user_no;
    private int content_no;

    @Override
    public String toString() {
        return "Like{" +
                "user=" + user +
                ", content=" + content +
                ", user_no=" + user_no +
                ", content_no=" + content_no +
                '}';
    }

    public int getUser_no() {
        return user_no;
    }

    public void setUser_no(int user_no) {
        this.user_no = user_no;
    }

    public int getContent_no() {
        return content_no;
    }

    public void setContent_no(int content_no) {
        this.content_no = content_no;
    }

    public Like(int user_no, int content_no) {
        this.user_no = user_no;
        this.content_no = content_no;
    }

    public Like(User user, Content content) {
        this.user = user;
        this.content = content;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Content getContent() {
        return content;
    }

    public void setContent(Content content) {
        this.content = content;
    }
}
