import 'package:dio/dio.dart';
import 'package:dio/io.dart';

final class ApiProxy extends DioForNative {
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
// _SimpleUri (http://api.nasa.gov/planetary/apodapi.nasa.gov/planetary/apod?api_key=sl6el3HcX7qeFPlUvSCW0D6qd9a4z9vriu4yTb6z&start_date&end_date)
  void _init() {
    interceptors.addAll(_interceptorsWrapper ?? []);

    options.baseUrl = 'https://$_apiUrl';

    options.queryParameters.addAll({'api_key': _apikey});
  }
}
