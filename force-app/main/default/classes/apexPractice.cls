public with sharing class apexPractice {
    public static String apexPractice(Integer num) { 
        return Math.mod(num, 2) == 0 ? 'Even' : 'Odd';
    }

    public static String apexPractice2(Integer num) {

        return Math.mod(num, 3) == 0 && Math.mod(num, 5) == 0 ? 'FizzBuzz'
        :Math.mod(num, 3) == 0 ? 'Fizz'
        :Math.mod(num, 5) == 0 ? 'Buzz'
        :'Not FizzBuzz';
    }

    public static Integer countDigits(Integer num){
        
        return String.valueOf(num).length();
    }

    public static Integer sumEven(List<Integer> numbers){
        Integer sum = 0;
        for (Integer num : numbers) {
            sum += (Math.mod(num, 2) == 0 ? num : 0);
        }
        return sum;
        
    }

    public static Map<Id, Integer> countContactsByAccountId(List<Contact> contactList){
        Map<Id, Integer> resultMap = new Map<Id, Integer>();

        for (Contact con : contactList) {
            if (con.AccountId == null) {
                continue;
            }
            if (resultMap.containsKey(con.AccountId)) {
                resultMap.put(con.AccountId, resultMap.get(con.AccountId) +1);

            } else {
                resultMap.put(con.AccountId, 1);
            }

        }
        return resultMap;
    }

}