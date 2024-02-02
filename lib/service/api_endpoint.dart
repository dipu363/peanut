import 'package:path/path.dart' as p;

class ApiEndPoints {
  ApiEndPoints._();
  static const String baseURL = 'https://peanut.ifxdb.com/api';
  static const String apiVersion = 'ClientCabinetBasic/';
  static String apiEndpoint = p.join(baseURL, apiVersion);
  static final AuthModule authModule = AuthModule();
  static final ProfileModule profileModule = ProfileModule();

}

class AuthModule {
  static final String _baseURL = ApiEndPoints.apiEndpoint;
  final String login = p.join(_baseURL, 'IsAccountCredentialsCorrect');
}
class ProfileModule {
  static final String _baseURL = ApiEndPoints.apiEndpoint;
  final String accountInfo = p.join(_baseURL, 'GetAccountInformation');
  final String phoneNo = p.join(_baseURL, 'GetLastFourNumbersPhone');
  final String openTrades = p.join(_baseURL, 'GetOpenTrades');
}

