class Housing {
  late String housingStatus;
  late String housingStreet;
  late String housingCity;
  late String housingState;
  late String housingZip;
  late String housingCounty;
  late String housingType;
  late String housingUnits;
  late String housingBedrooms;
  late String housingBeds;
  late String housingOccupancy;
  late String housingKitchen;




  Housing({status,street,city,state,zip,county,type,units,bedrooms,beds,occupancy, kitchen}) {
    housingStatus = status;
    housingStreet = street;
    housingCity = city;
    housingState = state;
    housingZip = zip;
    housingCounty = county;
    housingType = type;
    housingUnits = units;
    housingBedrooms = bedrooms;
    housingBeds = beds;
    housingOccupancy = occupancy;
    housingKitchen = kitchen;

  }
}