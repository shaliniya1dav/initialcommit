public class AddPrimaryContact  implements Queueable {
   String type;

   public AddPrimaryContact(String s){
        this.type=s;           
    }
    
    public void execute(QueueableContext context) {
 List<Account>accounts =[Select id, name from Account where Type=:type LIMIT 20];
      List<Contact>listcontact =new List<Contact> (); 
       
        for (Account a :accounts ){
        Contact cons= new Contact();
            cons.LastName='Trailhead';
            cons.AccountId= a.Id;
            listcontact.add(cons);
            
        }
   
       insert listcontact;  
        
    } 
}