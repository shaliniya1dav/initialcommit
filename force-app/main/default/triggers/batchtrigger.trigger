trigger batchtrigger on Account ( after insert) {
List<Account>acc= new List<Account>();
for(Account a:trigger.new){

acc.add(a);

}
if(acc.size()>0){
String q= 'select id, name from account where Id not IN(select accountId from Case) ';
String e ='Account';


//Account__c b= Account__c.getOrgDefaults();
 Database.executebatch( new deleteSubscribers(q,e),200);

}







}