public class customsetting {

public string myvalue{get;set;}

public  customsetting (){

//Account__c all= Account__c.getOrgDefaults();
Account__c myObj = Account__c.getValues('jobs_ID__c');

//myvalue= all.jobs_ID__c;




}






}