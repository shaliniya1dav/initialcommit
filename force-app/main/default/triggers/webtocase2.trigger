trigger webtocase2 on Case (after insert, after update) {



List<String> emailAddresses = new List<String>();
    //First exclude any cases where the contact is set
    for (Case caseObj:Trigger.new) {
        if (caseObj.ContactId==null &&
            caseObj.SuppliedEmail!='')
        {
            emailAddresses.add(caseObj.SuppliedEmail);
        }
    }


List<Contact>con=[Select Email from Contact where  Email IN:emailAddresses  ];
 Set<String> takenEmails = new Set<String>();
    for (Contact c:con) {
        takenEmails.add(c.Email);
    }
    
Map<String,Contact> emailToContactMap = new Map<String,Contact>();
    List<Case> casesToUpdate = new List<Case>();

if(Trigger.isBefore && Trigger.isInsert){
for(Case d:trigger.new){
if(takenEmails.size()==0 ){

Contact m= new contact(LastName='GenericContact',Email=d.SuppliedEmail);
Account at=new Account(Name= 'Generic account');
d.ContactId=m.Id;
d.AccountId=at.Id;
emailToContactMap.put(d.SuppliedEmail,m);

casesToUpdate.add(d);
}
}
update casesToUpdate ;
}




}