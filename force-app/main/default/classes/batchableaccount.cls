global  class batchableaccount implements Database.Batchable<sObject>{


global final string Query;
global final string Entity;
global final string Field;
global final string Value;


global batchableaccount(string q,string e,string f,string v){

Query=q;Entity=e;Field=f;Value=v;

}

global Database.QueryLocator start(Database.batchablecontext BC){

return Database.getQueryLocator(Query); }

global void execute(Database.BatchableContext bc, List<sObject> scope){

for(sObject o: scope){

o.put(Field,Value);

}
update scope;

}

global void finish(Database.batchablecontext BC){

AsyncApexJob a = [Select Id, Status, NumberOfErrors, JobItemsProcessed,TotalJobItems,CreatedBy.Email
from AsyncApexJob where Id = :BC.getJobId()];
string message = 'The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.';
// Send an email to the Apex job's submitter notifying of job completion.
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
String[] toAddresses = new String[] {a.CreatedBy.Email};
mail.setToAddresses(toAddresses);
mail.setSubject('Salesforce BatchUpdateField ' + a.Status);
mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.');
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail }); 



}
}