trigger addressmatch on Account ( after update) {

 List<Account> accs = 
        [SELECT Phone, Fax
         FROM Account WHERE Id IN :Trigger.New];

List<Account> totalacc= new List<Account> ();

for(Account a:accs ){
a.Phone= a.Fax;

totalacc.add(a);
}

update totalacc;



}