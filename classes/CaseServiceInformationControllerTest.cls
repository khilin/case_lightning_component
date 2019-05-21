@isTest
public class CaseServiceInformationControllerTest {
    public static testMethod void ifCaseHasDataReturnTheCorrectInfoInfo(){
        Case theCase = new Case();
        theCase.Origin = 'Phone';
        theCase.Home_Country__c = 'DE';
        theCase.Product__c = 'Standard';
        insert theCase;
        
        Test.startTest();
        Case_Service_Information__mdt controllerData = CaseServiceInformationController.loadInformation(theCase.Home_Country__c, theCase.Product__c);
        Test.stopTest();

        List<Case_Service_Information__mdt> databaseData = [SELECT ATM_Fee_in_other_currencies__c, Card_Replacement_Cost__c, Cost_per_Calendar_Month__c, Currency_Symbol__c
                                                    FROM Case_Service_Information__mdt WHERE Home_Country__c = :theCase.Home_Country__c AND Product__c = :theCase.Product__c];
		system.assertEquals(1, databaseData.size());        
        System.assertEquals(databaseData[0].ATM_Fee_in_other_currencies__c, controllerData.ATM_Fee_in_other_currencies__c);        
        System.assertEquals(databaseData[0].Card_Replacement_Cost__c, controllerData.Card_Replacement_Cost__c);        
        System.assertEquals(databaseData[0].Cost_per_Calendar_Month__c, controllerData.Cost_per_Calendar_Month__c);        
        System.assertEquals(databaseData[0].Currency_Symbol__c, controllerData.Currency_Symbol__c);        
    }
    
    public static testMethod void ifCaseHasNoDataReturnNull(){
        Case theCase = new Case();
        theCase.Origin = 'Phone';
        theCase.Home_Country__c = null;
        theCase.Product__c = null;
        insert theCase;
        
        Test.startTest();
        Case_Service_Information__mdt csi = CaseServiceInformationController.loadInformation(theCase.Home_Country__c, theCase.Product__c);
        Test.stopTest();
        
        System.assertEquals(null, csi);        
    }
}