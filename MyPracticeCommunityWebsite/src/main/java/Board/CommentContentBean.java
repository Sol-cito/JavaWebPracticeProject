package Board;

public class CommentContentBean {
    private String commentContent;
    private String author;
    private int rel_Seq;

    public CommentContentBean() {

    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String content) {
        this.commentContent = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getRel_Seq() {
        return rel_Seq;
    }

    public void setRel_Seq(int rel_Seq) {
        this.rel_Seq = rel_Seq;
    }
}
