import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ApiProxy extends DioForNative {
  final List<InterceptorsWrapper>? _interceptorsWrapper;
  final String _apiUrl;
  final String _apikey;

  ApiProxy({
    required String apiUrl,
    required String apikey,
    List<InterceptorsWrapper>? interceptorsWrapper,
  })  : _interceptorsWrapper = interceptorsWrapper,
        _apiUrl = apiUrl,
        _apikey = apikey {
    _init();
  }
  void _init() {
    interceptors.addAll(_interceptorsWrapper ?? []);

    options.baseUrl = 'https://$_apiUrl';

    options.queryParameters.addAll({'api_key': _apikey});
  }
}
