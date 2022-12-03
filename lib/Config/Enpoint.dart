import 'package:medic_petcare/Config/Network.dart';

class EndPoint {
  static urlLogin({
    required Map<String, dynamic> body,
  }) async {
    return Network().post(
      url: 'login',
      body: body,
      useToken: false,
    );
  }

  static urlUser() async {
    return Network().get(
      url: 'user',
    );
  }
}
