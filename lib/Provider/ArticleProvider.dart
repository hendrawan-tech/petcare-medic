import 'package:flutter/widgets.dart';
import 'package:medic_petcare/Config/Enpoint.dart';

class ArticleProvider with ChangeNotifier {
  List setArticle = [];
  List get getArticle => setArticle;
  bool setIsLoading = true;
  bool get isLoading => setIsLoading;

  Future<Map<String, dynamic>> article() async {
    try {
      setIsLoading = true;
      var response = await EndPoint.urlArticle();
      if (response['meta']['code'] == 200) {
        setArticle = response['data']['data'];
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
