package Board;

import java.util.Date;

public class BoardInfoBox {
    private int seq;
    private String title;
    private String text;
    private String author;
    private Date date;
    private int views;

    public BoardInfoBox(int seq, String title, String text, String author, Date date, int views) {
        this.seq = seq;
        this.title = title;
        this.text = text;
        this.author = author;
        this.date = date;
        this.views = views;
    }

    public int getSeq() {
        return seq;
    }

    public String getTitle() {
        return title;
    }

    public String getText() {
        return text;
    }

    public String getAuthor() {
        return author;
    }

    public Date getDate() {
        return date;
    }

    public int getViews() {
        return views;
    }
}
