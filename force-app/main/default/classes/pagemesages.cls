public class pagemesages {
 
public void pagemesages(){
 
ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'First Error Message added from apex'));
ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Second Error Message added from apex'));
 
}
}