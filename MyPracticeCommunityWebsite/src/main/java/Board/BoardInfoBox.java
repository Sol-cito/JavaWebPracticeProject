package Board;

import java.util.Date;

public class BoardInfoBox {
    private int seq;
    private String title;
    private String text;
    private String author;
    private Date date;

    public BoardInfoBox(int seq, String title, String text, String author, Date date) {
        this.seq = seq;
        this.title = title;
        this.text = text;
        this.author = author;
        this.date = date;
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
}
