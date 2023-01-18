public class Mycontroller
{
private final Account account;
public Mycontroller()
{
account=[ select Id, name,site FROM Account WHERE Id= :ApexPages.currentPage().getParameters().get('Id')];
}
public Account getAccount(){
ApexPages.currentPage().getUrl();
return account;}

public PageReference save(){
update account;
return null;
}
}