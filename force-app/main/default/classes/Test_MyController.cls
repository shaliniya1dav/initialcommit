@isTest
public class Test_MyController {
 static testMethod void myUnitTest() {
        test.startTest();
       Account acc = new Account();
         acc.Name = ' test';
  acc.Site = '';
       insert acc;
  PageReference testPage = new pagereference('/apex/VisualforcePage');
       ApexPages.currentPage().getParameters().put( 'id', acc.id );

 MyController MyControllerObj = new MyController();
  PageReference pageref = MyControllerObj.save();
        MyControllerObj.getAccount();
        test.stopTest();
}

}