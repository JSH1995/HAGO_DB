package models;

public class ConDetail {
    private int no;
    private String json;

    public ConDetail(int no, String json) {
        this.no = no;
        this.json = json;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }
    @Override
    public String toString() {
        return "ConDetail{" +
                "no=" + no +
                ", json=" + json +
                '}';
    }
}
