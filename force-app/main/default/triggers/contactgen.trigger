trigger contactgen on Account (after insert) {

List<Contact> con= new List<Contact>();

for(Account a : trigger.new){

Contact obj=new Contact();

obj.lastname='a.Name';
obj.AccountId= a.id;
con.add(obj);

}

insert con;
}