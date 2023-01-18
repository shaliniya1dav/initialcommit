global class deleteSubscribers implements Database.Batchable<sObject>{
    global final String Query;
    global final String Entity;
    
    global   deleteSubscribers(String q,String e){
        Query=q;
        Entity=e;
    }

    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC,List<sObject> scope){
        delete scope;
    }

    global void finish(Database.BatchableContext BC){
    
 String s='Prospect';

Account__c b= Account__c.getOrgDefaults();
b.jobs_ID__c=system.enqueueJob(new AddPrimaryContact(s));
    
    
    }
}