global class deletecontacts implements Database.Batchable<sObject>{
    global final String Query;
    global final String Entity;
    
    global   deletecontacts(String q,String e){
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
    
    String q= 'select id, name from account where Id not IN(select accountId from Case) ';
     String e ='Account';
    
    Database.executeBatch(new deleteSubscribers(q,e) );
    
    
    }
    }