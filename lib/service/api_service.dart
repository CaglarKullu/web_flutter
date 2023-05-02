import 'package:caglar_portfolio/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://api.emailjs.com/api/v1.0/email/")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;
  @POST('send')
  Future<PostModel> postEmail();
}
