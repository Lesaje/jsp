package model;

import java.io.Serializable;
import java.util.Date;

public class Post implements Serializable {
    private static final long serialVersionUID = 1L;

    private int postId;
    private String title;
    private String content;
    private String author;

    // Default constructor (required for JavaBean)
    public Post() {}

    public Post(int postId, String title, String content, String author) {
        this.postId = postId;
        this.title = title;
        this.content = content;
        this.author = author;
    }

    public int getPostId() { return postId; }

    public void setPostId(int postId) { this.postId = postId; }

    public String getTitle() { return title; }

    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }

    public void setContent(String content) { this.content = content; }

    public String getAuthor() { return author; }

    public void setAuthor(String author) { this.author = author; }

    @Override
    public String toString() {
        return "Post{" +
                "postId=" + postId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", author='" + author + '\'' +
                '}';
    }
}
