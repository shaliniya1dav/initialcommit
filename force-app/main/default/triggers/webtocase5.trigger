trigger webtocase5 on Case (before insert, before update) {



List<String> emailAddresses = new List<String>();
    //First exclude any cases where the contact is set
    for (Case caseObj:Trigger.new) {
        if (caseObj.ContactId==null &&
            caseObj.SuppliedEmail!='')
        {
            emailAddresses.add(caseObj.SuppliedEmail);
           system.debug('webemail'+emailAddresses); 
        }
    }


List<Contact>con=[Select Email from Contact where  Email IN:emailAddresses  ];
 Set<String> takenEmails = new Set<String>();
    for (Contact c:con) {
        takenEmails.add(c.Email);
    }
    
//Map<String,Contact> emailToContactMap = new Map<String,Contact>();
    List<Case> casesToInsert = new List<Case>();

if(Trigger.isBefore && Trigger.isInsert){
for(Case d:trigger.new){
if(takenEmails.size()>1 ){

Account__c mcs = Account__c.getInstance();

d.AccountId=mcs.Account_Name__c;
system.debug('Accountname'+d.AccountId);
d.ContactId=mcs.Contact_name__c;
system.debug('Contactname'+d.ContactId);

//Contact m= new contact(LastName='GenericContact',Email=d.SuppliedEmail);
//Account at=new Account(Name= 'Generic account');
//d.ContactId=m.Id;
//d.AccountId=at.Id;
//emailToContactMap.put(d.SuppliedEmail,m);

casesToInsert.add(d);
}
}
//insert casesToInsert ;
}




}