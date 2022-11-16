class Aewr {
  late String state;
  late String aewr;

  Aewr({s, a}) {
    state = s;
    aewr = a;
  }
}

class AewrList {
  int stateNumber = 0;

  final Map<String,String> stateAewrList = {
    'State':'AEWR',
    'AK':'10.34',
    'AL':'11.99',
    'AR':'12.45',
    'AZ':'14.79',
    'CA':'17.51',
    'CO':'15.58',
    'CT':'15.66',
    'DE':'15.54',
    'FL':'12.41',
    'GA':'11.99',
    'HI':'16.54',
    'IA':'16.19',
    'ID':'14.68',
    'IL':'15.89',
    'IN':'15.89',
    'KS':'16.47',
    'KY':'13.89',
    'LA':'12.45',
    'MA':'15.66',
    'MD':'15.54',
    'ME':'15.66',
    'MI':'15.37',
    'MN':'15.37',
    'MO':'16.19',
    'MS':'12.45',
    'MT':'14.68',
    'NC':'14.16',
    'ND':'16.47',
    'NE':'16.47',
    'NH':'15.66',
    'NJ':'15.54',
    'NM':'14.79',
    'NV':'15.58',
    'NY':'15.66',
    'OH':'15.89',
    'OK':'13.88',
    'OR':'17.41',
    'PA':'15.54',
    'RI':'15.66',
    'SC':'11.99',
    'SD':'16.47',
    'TN':'13.89',
    'TX':'13.88',
    'UT':'15.58',
    'VA':'14.16',
    'VT':'15.66',
    'WA':'17.41',
    'WI':'15.37',
    'WV':'13.89',
    'WY':'14.68',
  };
}

class LocationAbbr {
  int stateNumber = 0;

  final List<String> locationAbbr = <String>[
    'State',
    'AL',
    'AK',
    'AZ',
    'AR',
    'CA',
    'CO',
    'CT',
    'DE',
    'FL',
    'GA',
    'HI',
    'ID',
    'IL',
    'IN',
    'IA',
    'KS',
    'KY',
    'LA',
    'ME',
    'MD',
    'MA',
    'MI',
    'MN',
    'MS',
    'MO',
    'MT',
    'NE',
    'NV',
    'NH',
    'NJ',
    'NM',
    'NY',
    'NC',
    'ND',
    'OH',
    'OK',
    'OR',
    'PA',
    'RI',
    'SC',
    'SD',
    'TN',
    'TX',
    'UT',
    'VT',
    'VA',
    'WA',
    'WV',
    'WI',
    'WY',
  ];

}

