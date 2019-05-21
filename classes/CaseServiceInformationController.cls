public class CaseServiceInformationController {
    @AuraEnabled
    public static Case_Service_Information__mdt loadInformation(String homeCountry, String prod) {
        system.debug('homeCountry: ' + homeCountry);
        system.debug('prod: ' + prod);
        List<Case_Service_Information__mdt> csis = [SELECT ATM_Fee_in_other_currencies__c, Card_Replacement_Cost__c, Cost_per_Calendar_Month__c, Currency_Symbol__c
                                                    FROM Case_Service_Information__mdt WHERE Home_Country__c = :homeCountry AND Product__c = :prod];
        if(!csis.isEmpty()){
            return csis[0];
        }
        else{
            return null;
        }
    }
}