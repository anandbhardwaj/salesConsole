@isTesT(SeeAllData=true)
public class scs_SidebarControllerTest {


	static testMethod void testTheController() {
		
		List<Account> accounts = [select id, name from account where name = 'United Partners'];
		System.assert(!accounts.isEmpty());
		
		
		ApexPages.StandardController stdAccount = new ApexPages.StandardController(accounts[0]);
	    scs_SidebarController  scsController  = new scs_SidebarController (stdAccount);
	    scsController.init();
	    List<scs_SidebarWrapper> dataList = scsController.dataList;
	    
	    for(scs_SidebarWrapper w : dataList) {
	    	System.debug('Object Type - ['+w.objectLabel+']');
	    	List<String> fieldLabels = w.fieldLabels;
	    	List<String> fieldNames = w.fieldNames;
	    	List<List<Object>> fieldValues = w.fieldValues;
	    	
	    	System.assert(!fieldLabels.isEmpty());
	    	System.assert(!fieldNames.isEmpty());
	    	System.assert(!fieldValues.isEmpty());
	    	
	    	for(String label : fieldLabels) {
	    		System.debug(LoggingLevel.INFO, label);	
	    	}
			List<Map<String,Object>> moreValues = w.dataValues;
			for(Map<String,Object> single : moreValues) {
				for(String fieldName : fieldNames) {
					System.debug(LoggingLevel.INFO, single.get(fieldName));	
				}
			}
	    }
	    System.debug(scsController.jsonData);
	}
}