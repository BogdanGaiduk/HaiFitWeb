package com.FitPlanWeb.domain;


import javax.persistence.*;

@Entity
public class Message {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;
    private String text;
    private String tag;
    private String date;
    private String month;
    private String time;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;
    private String filename;

    public Message() {
    }

    public Message(String text, String tag, User user, String date, String time) {
        this.author = user;
        this.text = text;
        this.tag = tag;

        this.date = date;
        this.time = time;
    }

    public String getAuthorName(){
        return author!=null? author.getName()+(" ")+author.getSurname():"<none>";
    }

    public String getAvatar(){
        return author!=null? author.getFilename():"<none>";
    }

    public String getIdAuthor(){
        return author!=null? String.valueOf(author.getId()) :"<none>";
    }

    public User getAuthor() {
        return author;
    }
    public void setAuthor(User author) {
        this.author = author;
    }

    public void setText(String text) {
        this.text = text;
    }
    public String getText() {
        return text;
    }

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public String getTag() {
        return tag;
    }
    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getDate() { return date; }

    public void setDate(String date) { this.date = date; }

    public String getMonth() { return month; }

    public void setMonth(String month) { this.month = month; }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
