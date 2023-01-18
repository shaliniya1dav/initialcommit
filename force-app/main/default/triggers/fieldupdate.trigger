trigger fieldupdate on my_employee__c (before Insert, before Update) {

for (my_employee__c emp : trigger.new){



Account obj1= new Account();
emp.City__c=obj1.City__c;

Contact obj2= new Contact();
emp.City__c= obj2.City__c;







}








}