import 'package:dio/dio.dart';

class WeatherAPI {
  final Dio dio = Dio();
  final String apiKey; // OpenWeatherMap API anahtarınızı buraya ekleyin

  WeatherAPI(this.apiKey);

  Future<Map<String, dynamic>> getWeather(String city) async {
    try {
      final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {
          'q': city,
          'appid': apiKey, // API anahtarını burada kullanın
          'units': 'metric', // Ölçüm birimini metrik olarak ayarlayın
        },
      );
      return response.data;
    } catch (e) {
      throw Exception('Hava durumu verileri alınamadı: $e');
    }
  }
}


