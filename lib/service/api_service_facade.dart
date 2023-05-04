import 'package:caglar_portfolio/models/post_model.dart';

abstract class ApiServiceFacade {
  Future postEmail(PostModel post);
}
