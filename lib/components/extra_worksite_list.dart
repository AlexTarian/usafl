class Worksite {
  late String controllingBiz;
  late bool isEmpOwned;
  late String siteStreet;
  late String siteCity;
  late String siteState;
  late String siteZip;
  late String siteCounty;
  late String startDate;
  late String endDate;
  late String workersNeeded;


  Worksite({employer,owned,street,city,state,zip,county,start,end,workers}) {
    controllingBiz = employer;
    isEmpOwned = owned;
    siteStreet = street;
    siteCity = city;
    siteState = state;
    siteZip = zip;
    siteCounty = county;
    startDate = start;
    endDate = end;
    workersNeeded = workers;
  }
}