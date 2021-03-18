public with sharing class AnomalyDetector {

    public Anomaly_Range_Configuration__c anomalyRangeSetting;

    public AnomalyDetector() {
        this.anomalyRandeSetting = Anomaly_Range_Configuration__c.getOrgDefaults();
    }

    public List<Anomaly__c> detectAnomaly(Weather__c weather){
        List<Anomaly__c> anomaliesToSave = new List<Anomaly__c>();
        
        if (isTemperatureAnomaly(weather)) {
            anomaliesToSave.add(AnomalyFactory.createTemperatureAnomaly(weather));
        }
        if (isPressureAnomaly(weather)) {
            anomaliesToSave.add(AnomalyFactory.createPressureAnomaly(weather));
        }
        if (isHumidityAnomaly(weather)) {
            anomaliesToSave.add(AnomalyFactory.createHumidityAnomaly(weather));
        }

        return anomaliesToSave;
    }

    private Boolean isTemperatureAnomaly(Weather__c weather) {
        return anomalyRangeSetting.Min_Temperature__c > weather.Temperature__c || anomalyRangeSetting.Max_Temperature__c < weather.Temperature__c;
    }

    private Boolean isPressureAnomaly(Weather__c weather) {
        return anomalyRangeSetting.Min_Pressure__c > weather.Pressure__c || anomalyRangeSetting.Max_Pressure__c < weather.Pressure__c;
    }

    private Boolean isHumidityAnomaly(Weather__c weather) {
        return anomalyRangeSetting.Min_Humidity__c > weather.Humidity__c || anomalyRangeSetting.Max_Humidity__c < weather.Humidity__c;
    }
}