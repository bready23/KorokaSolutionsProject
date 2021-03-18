public with sharing class AnomalyFactory {

    public static Anomaly__c createTemperatureAnomaly(Weather__c weather) {
        return createAnomaly(weather, 'Temperature Anomaly');
    }

    private static Anomaly__c createPressureAnomaly(Weather__c weather) {
        return createAnomaly(weather, 'Pressure Anomaly');
    }

    private static Anomaly__c createHumidityAnomaly(Weather__c weather) {
        return createAnomaly(weather, 'Humidity Anomaly');
    }

    private static Anomaly__c createAnomaly(Weather__c weather, String type) {
        return new Anomaly_c(
            City__c = weather.City__c,
            City_name__c = weather.City_c.City_Code__c,
            Reported__c = false,
            Type__c = type,
            Weather__c = weather
        );
    }

    private AnomalyFactory() {}
}
