public class contacts{

@AuraEnabled

public static List<Contact> getContacts(){

List<Contact> conList= new List<Contact>([Select Id, Lastname,Phone,Email from Contact where Email!= Null]);
return conList;

}

}