package models;

import java.util.ArrayList;

public class ContentsForTypes {
    private ArrayList<Content> contentsForTypes;
    private ArrayList<Content> sciences;
    private ArrayList<Content> socials;
    private ArrayList<Content> languages;
    private ArrayList<Content> maths;

    public ContentsForTypes(ArrayList<Content> contentsForTypes,ArrayList<Content> sciences, ArrayList<Content> socials, ArrayList<Content> languages, ArrayList<Content> maths) {
        this.contentsForTypes = contentsForTypes;
        this.sciences = sciences;
        this.socials = socials;
        this.languages = languages;
        this.maths = maths;
    }

    public ArrayList<Content> getContentsForTypes() {
        return contentsForTypes;
    }

    public void setContentsForTypes(ArrayList<Content> contentsForTypes) {
        this.contentsForTypes = contentsForTypes;
    }

    public ArrayList<Content> getSciences() {
        return sciences;
    }

    public void setSciences(ArrayList<Content> sciences) {
        this.sciences = sciences;
    }

    public ArrayList<Content> getSocials() {
        return socials;
    }

    public void setSocials(ArrayList<Content> socials) {
        this.socials = socials;
    }

    public ArrayList<Content> getLanguages() {
        return languages;
    }

    public void setLanguages(ArrayList<Content> languages) {
        this.languages = languages;
    }

    public ArrayList<Content> getMaths() {
        return maths;
    }

    public void setMaths(ArrayList<Content> maths) {
        this.maths = maths;
    }

    @Override
    public String toString() {
        return "ContentsForTypes{" +
                "contentsForTypes=" + contentsForTypes +
                ", sciences=" + sciences +
                ", socials=" + socials +
                ", languages=" + languages +
                ", maths=" + maths +
                '}';
    }
}
