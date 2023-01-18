@isTest 
public class ExtensionTestClass 
{
 static testMethod void testMethod1() 
 {
 Account testAccount = new Account();
 testAccount.Name='Test Account' ;
 insert testAccount;

 Test.StartTest(); 
  ApexPages.StandardController sc = new ApexPages.StandardController(testAccount);
  myControllerExtension testAccPlan = new myControllerExtension(sc);

  PageReference pageRef = Page.page3; // Add your VF page Name here
  pageRef.getParameters().put('id', String.valueOf(testAccount.Id));
  Test.setCurrentPage(pageRef);

  //testAccPlan.save(); call all your function here
 Test.StopTest();
 }
}