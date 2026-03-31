package controller;

import model.Topic;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class TopicController {
    List<Topic> topicList = new ArrayList<>();
    int idCounter=0;
    public String addTopic(String topicName){
        if (topicName.isEmpty()|| topicName == ""){
            return "please fill the topic field";
        }
        idCounter+=1;
        Timestamp createdDate = new Timestamp(System.currentTimeMillis());
        Timestamp updatedDate = createdDate;
        Topic topicObject = new Topic(idCounter,topicName, createdDate,updatedDate);
        topicList.add(topicObject);
        return "Successfully New Topic Added";
    }
}
