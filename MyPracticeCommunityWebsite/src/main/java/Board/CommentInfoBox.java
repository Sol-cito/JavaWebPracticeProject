package Board;

import java.util.Date;

public class CommentInfoBox {
    private String author;
    private String content;
    private Date date;
    private int num_like;
    private int num_dislike;

    public CommentInfoBox(String author, String content, Date date, int num_like, int num_dislike) {
        this.author = author;
        this.content = content;
        this.date = date;
        this.num_like = num_like;
        this.num_dislike = num_dislike;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getNum_like() {
        return num_like;
    }

    public void setNum_like(int num_like) {
        this.num_like = num_like;
    }

    public int getNum_dislike() {
        return num_dislike;
    }

    public void setNum_dislike(int num_dislike) {
        this.num_dislike = num_dislike;
    }
}
