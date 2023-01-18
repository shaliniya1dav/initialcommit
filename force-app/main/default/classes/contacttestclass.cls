@isTest

private class contacttestclass{

static testmethod void testcontact(){

Account c = new Account();
c.Name='Sagar Salesforce';
insert c;


List<Contact> con=[Select id, name from Contact where AccountId=:c.id];
 system.assertEquals(1,con.size());








}















}