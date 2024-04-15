import 'package:dio/dio.dart';

class ApiProxy extends DioMixin {
  final List<InterceptorsWrapper>? _interceptorsWrapper;
  final String _apiUrl;

  ApiProxy({
    required String apiUrl,
    List<InterceptorsWrapper>? interceptorsWrapper,
  })  : _interceptorsWrapper = interceptorsWrapper,
        _apiUrl = apiUrl {
    _init();
  }

  void _init() {
    interceptors.addAll(_interceptorsWrapper ?? []);

    options.listFormat = ListFormat.multiCompatible;
    options.queryParameters.addAll({'api_key': _apiUrl});
    options.baseUrl = 'http://$_apiUrl';
  }
}
