public with sharing class UseCase_7 {
    // Write a method that allows you to split the bill amongst your friends
    public static Integer splitBill(Integer friends, Integer bills){
        Integer splitedBill = 0;

        if(friends != null && bills != null){
            splitedBill = bills / friends;
        }

        return splitedBill;
    }
}