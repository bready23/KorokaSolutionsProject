public with sharing class WeatherTriggerHandler {

    private static AnomalyDetector detector = new AnomalyDetector();

    public static void handleBeforeInsert(List<Weather__c> newList){}

    public static void handleAfterInsert(List<Weather__c> newList) {
        List<Anomaly__c> anomalies = new List<Anomaly__c>();
        
        for (Weather__c weather : newList) {
            anomalies.addAll(detector.detectAnomaly(weather));
        }

        insert anomalies;
    }

    public static void handleBeforeUpdate(List<Weather__c> newList, List<Weather__c> oldList) {}

    public static void handleAfterUpdate(List<Weather__c> newList, List<Weather__c> oldList) {}

    public static void handleBeforeDelete(List<Weather__c> oldList) {}

    public static void handleAfterDelete(List<Weather__c> oldList) {}
    
}