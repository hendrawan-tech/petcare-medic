import 'package:flutter/widgets.dart';
import 'package:medic_petcare/Config/Enpoint.dart';
import 'package:medic_petcare/Utils/Utils.dart';

class PracticeScheduleProvider with ChangeNotifier {
  List setSchedule = [];
  List get getSchedule => setSchedule;
  Map setNowSchedule = {};
  Map get getNowSchedule => setNowSchedule;
  bool setIsLoading = true;
  bool get isLoading => setIsLoading;

  Future<Map<String, dynamic>> getShcedule() async {
    try {
      setIsLoading = true;
      var response = await EndPoint.urlScheduleDoctor();
      if (response['meta']['code'] == 200) {
        setSchedule = [];
        setNowSchedule = {};
        for (var element in response['data']) {
          if (element['day'] == parseDay(DateTime.now().toString())) {
            setNowSchedule.addAll(element);
          } else {
            setSchedule.add(element);
          }
        }
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
