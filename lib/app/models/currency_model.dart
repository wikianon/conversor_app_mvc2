class CurrencyModel {
  final String name;
  final double real;
  final double dolar;
  final double euro;
  final double libra;
  final double bitcoin;

  CurrencyModel({required this.name, required this.real, required this.dolar, required this.euro, required this.libra, required this.bitcoin});

  static List<CurrencyModel> getCurrencies(){
    return <CurrencyModel>[
      CurrencyModel(name: 'Real', real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016, libra: 0.15),
      CurrencyModel(name: 'Dolar', real: 5.63, dolar: 1.0, euro: 0.85, bitcoin: 0.000088, libra: 0.83),
      CurrencyModel(name: 'Euro', real: 4.30, dolar: 1.17, euro: 1.0, bitcoin: 0.00010, libra: 0.86),
      CurrencyModel(name: 'Libra', real: 6.49, dolar: 1.2, euro: 1.16, bitcoin: 0.00010, libra: 1.0),
      CurrencyModel(name: 'Bitcoin', real: 64116.51, dolar: 11351.30, euro: 9689.34, bitcoin: 1.0, libra: 13.587),
    ]; //<CurrencyModel>
  }
}