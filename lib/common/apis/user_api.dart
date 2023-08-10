import 'package:ulearing/common/entities/entities.dart';
import 'package:ulearing/common/utils/http_util.dart';

//repository
class UserApi {
  static login({LoginRequestEntity? param}) async {
    // var result = await UserAPI.login(params: loginRequestEntity);
    var response = await HttpUtil().post(
      'api/login',
      queryParameters: param?.toJson(),
    );

    print(response.toString());
  }
}
