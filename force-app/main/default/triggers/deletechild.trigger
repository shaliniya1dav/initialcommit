trigger deletechild on Account (before delete) {

if(Trigger.isDelete){
List <Opportunity> opp= [Select name from Opportunity where AccountId IN:exampledelete.method1(trigger.old)];
//delete opp;
Database.emptyRecycleBin(opp);

}
}