package models;

import java.util.ArrayList;

public class ProfileContents {
    private ArrayList<Content> recents;
    private ArrayList<Content> edits;
    private ArrayList<Content> shares;
    private ArrayList<Content> likes;

    public ProfileContents() {
    }

    @Override
    public String toString() {
        return "ProfileContents{" +
                "recents=" + recents +
                ", edits=" + edits +
                ", shares=" + shares +
                ", likes=" + likes +
                '}';
    }

    public ProfileContents(ArrayList<Content> recents, ArrayList<Content> edits, ArrayList<Content> shares, ArrayList<Content> likes) {
        this.recents = recents;
        this.edits = edits;
        this.shares = shares;
        this.likes = likes;
    }

    public ArrayList<Content> getRecents() {
        return recents;
    }

    public void setRecents(ArrayList<Content> recents) {
        this.recents = recents;
    }

    public ArrayList<Content> getEdits() {
        return edits;
    }

    public void setEdits(ArrayList<Content> edits) {
        this.edits = edits;
    }

    public ArrayList<Content> getShares() {
        return shares;
    }

    public void setShares(ArrayList<Content> shares) {
        this.shares = shares;
    }

    public ArrayList<Content> getLikes() {
        return likes;
    }

    public void setLikes(ArrayList<Content> likes) {
        this.likes = likes;
    }
}
