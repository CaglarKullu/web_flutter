import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'SERVICE_ID', obfuscate: true)
  static final serviceID = _Env.serviceID;
  @EnviedField(varName: 'TEMPLETE_ID', obfuscate: true)
  static final templeteID = _Env.templeteID;
  @EnviedField(varName: 'USER_ID', obfuscate: true)
  static final userID = _Env.userID;
  @EnviedField(varName: 'EMAIL_URL', obfuscate: true)
  static final emailUrl = _Env.emailUrl;
}
