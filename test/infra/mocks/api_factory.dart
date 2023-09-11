class ApiFactory {
  static List<Map<String, dynamic>> brandsList() => [
    {
      'code': '1',
      'name': 'Acura',
    },
    { 
      'code': '2',
      'name': 'Agrale',
    },
    {
      'code': '3',
      'name': 'Alfa Romeo',
    },
  ];

  static List<Map<String, dynamic>> modelsList() => [
    {
      'code': '5',
      'name': '145 Elegant 1.7/1.8 16V'
    },
    {
      'code': '6',
      'name': '145 Elegant 2.0 16V',
    },
  ];

  static List<Map<String, dynamic>> yearsList() => [
    {
      'code': '1998-1',
      'name': '1998 Gasolina'
    },
    {
      'code': '1997-1',
      'name': '1997 Gasolina',
    },
    {
      'code': '1996-1',
      'name': '1996 Gasolina',
    },
    {
      'code': '1995-1',
      'name': '1995 Gasolina',
    },
  ];

  static Map<String, dynamic> fipeInfo() => {
    'vehicleType': 1,
    'price': 'R\$ 16.854,00',
    'brand': 'Alfa Romeo',
    'model': '145 Elegant 2.0 16V',
    'modelYear': 1997,
    'fuel': 'Gasolina',
    'codeFipe': '006001-1',
    'referenceMonth': 'setembro de 2023',
    'fuelAcronym': 'G',
  };
}