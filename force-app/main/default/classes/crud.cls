public class crud {

List<Schema.SObjectType>gd=Schema.getGlobalDescribe().values();
 public void method1(){
for(Schema.SObjectType obj:gd){
    
   System.debug('object name is'+obj.getDescribe().getName()); 
   System.debug('object name is'+obj.getDescribe().getName()+'fields'+obj.getDescribe().fields.getMap().Values());  
    
}

}




}