trigger childparen on Account (after insert,after update) {

List<Id> IDs =new List<Id>();
//List<Contact>cons=new List<Contact>();
for(Account a :trigger.new){
if(a.City__c!=null){
IDs.add(a.Id);
}
}
List<Account> acc= new List<Account> ([Select City__c from Account where Id IN:IDs]);
List<Contact> cons=new List<Contact>([Select City__c from Contact where AccountId IN:IDs]);
//for (Contact ct:trigger.new){

//for(Account a:acc){
for(integer i;i< cons.size(); i++){

String address= ''+acc[0].get('City__c');
cons[i].City__c = address;

}

update cons;
}