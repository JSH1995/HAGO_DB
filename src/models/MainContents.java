package models;

import java.util.ArrayList;

public class MainContents {
    private ArrayList<Content> hitContents;
    private ContentsForTypes studys;
    private ContentsForTypes shares;

    public MainContents(ArrayList<Content> hitContents, ContentsForTypes studys, ContentsForTypes shares) {
        this.hitContents = hitContents;
        this.studys = studys;
        this.shares = shares;
    }

    @Override
    public String toString() {
        return "MainContents{" +
                "hitContents=" + hitContents +
                ", studys=" + studys +
                ", shares=" + shares +
                '}';
    }

    public ArrayList<Content> getHitContents() {
        return hitContents;
    }

    public void setHitContents(ArrayList<Content> hitContents) {
        this.hitContents = hitContents;
    }

    public ContentsForTypes getStudys() {
        return studys;
    }

    public void setStudys(ContentsForTypes studys) {
        this.studys = studys;
    }

    public ContentsForTypes getShares() {
        return shares;
    }

    public void setShares(ContentsForTypes shares) {
        this.shares = shares;
    }
}
