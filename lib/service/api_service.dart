import 'dart:convert';
import 'dart:developer';

import 'package:caglar_portfolio/models/post_model.dart';
import 'package:caglar_portfolio/service/api_service_facade.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart' as dio;

class ApiService implements ApiServiceFacade {
  @override
  Future postEmail(PostModel post) async {
    try {
      final serviceId = dotenv.env['SERVICE_ID'];
      final templateId = dotenv.env['TEMPLETE_ID'];
      final userId = dotenv.env['USER_ID'];
      final url = dotenv.env['EMAIL_URL']!;
      final diDio = dio.Dio();
      diDio.options.headers['origin'] = 'http:localhost';
      diDio.options.headers['Content-Type'] = 'application/json';
      final dioResponse = await diDio.post(url,
          data: json.encode({
            'service_id': serviceId,
            'template_id': templateId,
            'user_id': userId,
            'template_params': {
              'user_subject': post.subject,
              'user_message': post.message,
              'user_email': post.email,
            },
          }));

      if (dioResponse.statusCode == 200) {
        log(dioResponse.statusCode.toString());
      } else {
        log(dioResponse.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    ;
  }
}
