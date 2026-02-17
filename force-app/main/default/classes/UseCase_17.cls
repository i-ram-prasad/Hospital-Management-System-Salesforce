public with sharing class UseCase_17 {
    public static List<Integer> findMinAndMax (List<Integer>listInt){
        List<Integer> minAndMaxList = new List<Integer>();

        if (listInt.size() > 0) {
            Integer minNum = listInt[0];
            Integer maxNum = 0;
            for(Integer eachnum : listInt){
                if(eachnum >= maxNum){
                    maxNum = eachnum;
                }
                if(eachnum <= minNum){
                    minNum = eachnum;
                }
            }
            minAndMaxList.add(maxNum);
            minAndMaxList.add(minNum);

        }
        return minAndMaxList;

    }
}