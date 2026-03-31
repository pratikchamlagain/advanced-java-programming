package view;

import controller.TopicController;

import java.util.Scanner;

public class View {
    public void start(){
        Scanner sc = new Scanner(System.in);
        System.out.println("Choose any one option from below");
        System.out.println("1. Add new Topic");
        System.out.println("2. View all Topics");
        String input = sc.nextLine();
        TopicController topicController = new TopicController();
        switch (input){
            case "1":
                System.out,println("Enter the topic Name: ");
                String topicName = sc.nextLine();


                break;
            case "2":
                System.out,println("User choosed the option 2");
                break;
            default:
                System.out.println("Option invalid");
        }

    }
}
