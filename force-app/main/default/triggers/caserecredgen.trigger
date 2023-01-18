trigger caserecredgen on Contact (after insert) {
List<Case> cse= new List<Case>();

for( Contact c : trigger.new){

{

Case obj=new Case();
obj.Origin='Phone';
obj.Status='New';
obj.ContactId=c.id;



cse.add(obj);

}

insert cse;
}





}