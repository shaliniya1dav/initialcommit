trigger acctrigg on Account (before insert, before update) {
 

Account  accs = Trigger.new [0];
List<Contact> cons= [Select id, phone,description from contact where accountID =: accs.ID];

}