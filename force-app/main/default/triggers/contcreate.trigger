trigger contcreate on Account (after insert) {

List<Contact> con= new List<Contact>();

for(Account a : trigger.New){

Contact obj=new Contact();

obj.firstname=a.Name;
obj.lastname=a.Name;

con.add(obj);

}
insert con;
}