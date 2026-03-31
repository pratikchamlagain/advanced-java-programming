package model;

import java.sql.Timestamp;
public class Topic {
    private int id;
    private String name;
    private Timestamp createdDate;
    private Timestamp updateDate;

    public Topic(int id, String name, Timestamp createdDate, Timestamp updateDate) {
        this.id = id;
        this.name = name;
        this.createdDate = createdDate;
        this.updateDate = updateDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    public Timestamp getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Timestamp updateDate) {
        this.updateDate = updateDate;
    }
}
