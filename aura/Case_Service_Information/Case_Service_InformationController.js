({
    doInit : function(component, event, helper) {
		var action = component.get("c.loadInformation");
        action.setParams({
            "homeCountry": component.get("v.caseRecord.Home_Country__c"),
            "prod": component.get("v.caseRecord.Product__c")            
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                var res = response.getReturnValue();
	            console.log(res);
                component.set("v.caseServiceInfo", res);
            }
        });
        // Invoke the service
        $A.enqueueAction(action);
    }
})