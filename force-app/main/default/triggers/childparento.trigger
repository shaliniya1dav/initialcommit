trigger childparento on Contact (after insert ,after update) {

List<Id> IDs =new List<Id>();
//List<Contact>cons=new List<Contact>();
for(Contact c :trigger.new){
if(c.City__c!=null&& c.AccountId!=Null){
IDs.add(c.AccountId);
}
}
List<Account> acc= new List<Account> ([Select City__c from Account where Id IN:IDs]);
List<Contact> cons=new List<Contact>([Select City__c from Contact where AccountId IN:IDs]);
//for (Contact ct:trigger.new){

//for(Account a:acc){
for(integer i;i< acc.size(); i++){

String address= ''+cons[0].get('City__c');
acc[i].City__c = address;

}

update acc;
}