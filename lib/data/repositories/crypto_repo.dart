import 'package:http/http.dart' as http;
import '../data_sources/crypto_api.dart';

class CryptoRepo {
  Future<http.Response> getCrypto() async {
    return await CryptoApi().getCryptocurrency();
  }
}
