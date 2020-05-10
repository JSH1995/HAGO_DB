package models;

import java.sql.Date;

public class User {
    private int no;
    private Date regDate;
    private Date birthDate;
    private String year;
    private String month;
    private String day;
    private String id;
    private String password;
    private String email;
    private String gender;
    private String nickname;
    private int phone;
    private boolean agree;
    private String img;

    /*int no, Date regDate, Date birthDate, String id, String password, String email, String gender, String nickname, int phone, int agree, String img*/
    public User(int no, Date regDate, Date birthDate, String id, String password, String email, String gender, String nickname, int phone, boolean agree, String img) {
        this.no = no;
        this.regDate = regDate;
        this.birthDate = birthDate;
        this.year = this.birthDate.toString().substring(0,4);
        this.month = this.birthDate.toString().substring(5,7);
        this.day = this.birthDate.toString().substring(8,10);
        this.id = id;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.nickname = nickname;
        this.phone = phone;
        this.agree = agree;
        this.img = img;
    }

    public User() {

    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public boolean isAgree() {
        return agree;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "User{" +
                "no=" + no +
                ", regDate=" + regDate +
                ", birthDate=" + birthDate +
                ", id=" + id +
                ", password=" + password +
                ", email=" + email +
                ", gender=" + gender +
                ", nickname=" + nickname +
                ", phone=" + phone +
                ", agree=" + agree +
                ", img=" + img +
                '}';
    }
}
