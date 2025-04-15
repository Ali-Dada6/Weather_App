import 'package:dio/dio.dart';

class ApiRepository {
  // كلاس عام يمكن إعادة استخدامه لأي طلب GET API.
  final String? url; // الرابط
  final Map<String, dynamic>? payload; // بارامترات إضافية

  ApiRepository({this.url, this.payload});

  Dio _dio = Dio();

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _dio.get(url!, queryParameters: this.payload).then((response) {
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    }).catchError((error) {
      if (onError != null) {
        onError(error);
      }
    });
  }
}
