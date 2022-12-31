import 'package:flutter/widgets.dart';
import 'package:medic_petcare/Config/Enpoint.dart';

class RegistrationProvider with ChangeNotifier {
  List setRegistration = [];
  List get getRegistration => setRegistration;
  bool setIsLoading = true;
  bool get isLoading => setIsLoading;

  Map setRegistrationItem = {};
  Map get getRegistrationItem => setRegistrationItem;

  Future<Map<String, dynamic>> listRegistration({
    required String limit,
  }) async {
    try {
      setIsLoading = true;
      var response = await EndPoint.listRegistration(
        limit: limit,
      );
      if (response['meta']['code'] == 200) {
        setRegistration = response['data']['data'];
        setIsLoading = false;
        notifyListeners();
        return response;
      } else {
        return response;
      }
    } catch (e) {
      return {
        "message": e.toString(),
      };
    }
  }

  Future<Map> setItemRegistration({
    required Map data,
  }) async {
    try {
      setRegistrationItem = {};
      setRegistrationItem = data;
      notifyListeners();
      return data;
    } catch (e) {
      return {
        "message": e.toString(),
      };
    }
  }
}
