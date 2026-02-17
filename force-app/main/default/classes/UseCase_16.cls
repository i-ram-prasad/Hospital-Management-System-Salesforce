public with sharing class UseCase_16 {
    public static Integer sumOfAll(Integer finalNum){
        Integer totalsum = 0;

        for (Integer i = 1 ; i <= finalNum; i++) {
            totalsum += i;
        }
        return totalsum;
    }
}