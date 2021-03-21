public with sharing class AnomalyFactory {

    public static Anomaly__c createTemperatureAnomaly(Weather__c weather) {
        return createAnomaly(weather, 'Temperature Anomaly');
    }

    public static Anomaly__c createPressureAnomaly(Weather__c weather) {
        return createAnomaly(weather, 'Pressure Anomaly');
    }

    public static Anomaly__c createHumidityAnomaly(Weather__c weather) {
        return createAnomaly(weather, 'Humidity Anomaly');
    }

    private static Anomaly__c createAnomaly(Weather__c weather, String type) {
        return new Anomaly__c(
            City__c = weather.City__c,
            Reported__c = false,
            Type__c = type,
            Weather__c = weather.Id
        );
    }

    private AnomalyFactory() {}
}
