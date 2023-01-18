public class apexcalllight {

    @AuraEnabled
    public static List<Contact> getlistmn(){
      List<Contact> listm = new  List<Contact> ([select Id,Phone,Email, name from contact  LIMIT 10]);
        return listm;        
    }
    
 @AuraEnabled
    public static Contact createContact(Contact con,Id AccountId){
        
        con.accountId=AccountId;
        insert con;
        return con;
    }
        
        
}