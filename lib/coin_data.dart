import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'apikey=BAFC345F-6EB6-442B-8681-F779E07C6EC5#';

// https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=BAFC345F-6EB6-442B-8681-F779E07C6EC5#
class CoinData {
  Future getCoinData(String currenciesListItem) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String requstedURL = '$apiURL/$crypto/$currenciesListItem?$apiKey';
      http.Response response = await http.get(requstedURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double price = decodedData['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(2);
      } else {
        print(response.statusCode);
      }
    }
    return cryptoPrices;
  }
}
