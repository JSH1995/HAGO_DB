package models;

public class AdminManage {
    private int no;
    private String bannerAll;
    private String bannerLearn;
    private String bannerShare;
    private String comIntro;
    private String comVideo;
    private String comInsta;
    private String comFacebook;
    private String location;
    private String googleForm;

    public AdminManage(int no, String bannerAll, String bannerLearn, String bannerShare, String comIntro, String comVideo, String comInsta,
                       String comFacebook, String location, String googleForm) {
        this.no = no;
        this.bannerAll = bannerAll;
        this.bannerLearn = bannerLearn;
        this.bannerShare = bannerShare;
        this.comIntro = comIntro;
        this.comVideo = comVideo;
        this.comInsta = comInsta;
        this.comFacebook = comFacebook;
        this.location = location;
        this.googleForm = googleForm;
    }

    public AdminManage() {

    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getBannerAll() {
        return bannerAll;
    }

    public void setBannerAll(String bannerAll) {
        this.bannerAll = bannerAll;
    }

    public String getBannerLearn() {
        return bannerLearn;
    }

    public void setBannerLearn(String bannerLearn) {
        this.bannerLearn = bannerLearn;
    }

    public String getBannerShare() {
        return bannerShare;
    }

    public void setBannerShare(String bannerShare) {
        this.bannerShare = bannerShare;
    }

    public String getComIntro() {
        return comIntro;
    }

    public void setComIntro(String comIntro) {
        this.comIntro = comIntro;
    }

    public String getComVideo() {
        return comVideo;
    }

    public void setComVideo(String comVideo) {
        this.comVideo = comVideo;
    }

    public String getComInsta() {
        return comInsta;
    }

    public void setComInsta(String comInsta) {
        this.comInsta = comInsta;
    }

    public String getComFacebook() {
        return comFacebook;
    }

    public void setComFacebook(String comFacebook) {
        this.comFacebook = comFacebook;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getGoogleForm() {
        return googleForm;
    }

    public void setGoogleForm(String googleForm) {
        this.googleForm = googleForm;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "no=" + no +
                ", bannerAll=" + bannerAll +
                ", bannerLearn=" + bannerLearn +
                ", bannerShare=" + bannerShare +
                ", comIntro=" + comIntro +
                ", comVideo=" + comVideo +
                ", comInsta=" + comInsta +
                ", comFacebook=" + comFacebook +
                ", location=" + location +
                ", googleForm=" + googleForm +
                '}';
    }
}
