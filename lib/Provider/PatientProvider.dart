import 'package:flutter/widgets.dart';
import 'package:medic_petcare/Config/Enpoint.dart';

class PatientProvider with ChangeNotifier {
  List setPatients = [];
  List get getPatients => setPatients;
  bool setIsLoading = true;
  bool get isLoading => setIsLoading;

  Future<Map<String, dynamic>> listPatient() async {
    try {
      setIsLoading = true;
      var response = await EndPoint.listPatient();
      if (response['meta']['code'] == 200) {
        setPatients = response['data'];
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
}
