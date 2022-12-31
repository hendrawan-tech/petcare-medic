import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:medic_petcare/Config/Enpoint.dart';
import 'package:http/http.dart' as http;
import 'package:medic_petcare/Config/Network.dart';
import 'package:medic_petcare/Utils/Storage.dart';
import 'package:medic_petcare/Utils/StorageKey.dart';

class MedicalRecordProvider with ChangeNotifier {
  List setMedicalRecord = [];
  List get getMedicalRecord => setMedicalRecord;
  List setPatientMedicalRecord = [];
  List get getPatientMedicalRecord => setPatientMedicalRecord;
  List setMedicalRecordHistory = [];
  List get getMedicalRecordHistory => setMedicalRecordHistory;
  List setTreatment = [];
  List get getTreatment => setTreatment;
  List setDrug = [];
  List get getDrug => setDrug;
  List setTmpDrug = [];
  List get getTmpDrug => setTmpDrug;
  List setControlSchedule = [];
  List get gettControlSchedule => setControlSchedule;
  List setPrescription = [];
  List get getPrescription => setPrescription;

  Map setItemMedicalRecord = {};
  Map get getItemMedicalRecord => setItemMedicalRecord;

  String _idInvoice = "";
  String get idInvoice => _idInvoice;

  bool setIsLoadingMedic = true;
  bool get isLoadingMedic => setIsLoadingMedic;
  bool setIsLoadingDrug = true;
  bool get isLoadingDrug => setIsLoadingDrug;
  bool setIsLoadingTreatment = true;
  bool get isLoadingTreatment => setIsLoadingTreatment;
  bool setIsLoadingPrescription = true;
  bool get isLoadingPrescription => setIsLoadingPrescription;
  bool setIsLoadingControlSchedule = true;
  bool get isLoadingControlSchedule => setIsLoadingControlSchedule;

  Future<Map<String, dynamic>> listMedicalRecord() async {
    try {
      setIsLoadingMedic = true;
      setMedicalRecordHistory = [];
      setMedicalRecord = [];
      var response = await EndPoint.getMedicalRecord();
      if (response['meta']['code'] == 200) {
        for (var data in response['data']['data']) {
          if (data['medical_record']['inpatients']['status'] == 'Dirawat') {
            setMedicalRecord.add(data);
            setIsLoadingMedic = false;
            notifyListeners();
          } else {
            setMedicalRecordHistory.add(data);
            setIsLoadingMedic = false;
            notifyListeners();
          }
        }
        setIsLoadingMedic = false;
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

  Future<Map<String, dynamic>> listPatientControlSchedule() async {
    try {
      setIsLoadingMedic = true;
      setPatientMedicalRecord = [];
      var response = await EndPoint.patientControleSchedule();
      if (response['meta']['code'] == 200) {
        for (var data in response['data']['data']) {
          if (data['medical_record']['inpatients']['invoice']
                  ['control_scedules'] !=
              null) {
            setPatientMedicalRecord.add(data);
            setIsLoadingMedic = false;
            notifyListeners();
          }
        }
        setIsLoadingMedic = false;
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

  Future<Map<String, dynamic>> tempDrug({
    required List<Map<String, dynamic>> data,
  }) async {
    try {
      setTmpDrug = data;
      notifyListeners();
      return {
        "message": "success",
      };
    } catch (e) {
      return {
        "message": e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> clearTempDrug() async {
    try {
      setTmpDrug = [];
      notifyListeners();
      return {
        "message": "success",
      };
    } catch (e) {
      return {
        "message": e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> listDrug() async {
    try {
      setIsLoadingDrug = true;
      var response = await EndPoint.getDrug();
      if (response['meta']['code'] == 200) {
        setDrug = response['data']['data'];
        setIsLoadingDrug = false;
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

  Future<Map<String, dynamic>> addDrug({
    required List data,
  }) async {
    try {
      setIsLoadingDrug = true;
      var listData = [];
      for (var item in data) {
        listData.add({
          "quantity": item['quantity'],
          "product_id": item['id'],
          "price": item['price'],
          "description": item['description'],
          "invoice_id": _idInvoice,
        });
      }
      var response = await EndPoint.postDrug(
        data: listData,
        invoiceId: _idInvoice,
      );
      if (response['meta']['code'] == 200) {
        setIsLoadingDrug = false;
        notifyListeners();
        return response;
      } else {
        setIsLoadingDrug = false;
        notifyListeners();
        return response;
      }
    } catch (e) {
      return {
        "message": e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> listTreatment() async {
    try {
      setIsLoadingTreatment = true;
      var response = await EndPoint.getTreatment(
        invoiceId: _idInvoice,
      );
      if (response['meta']['code'] == 200) {
        setTreatment = response['data']['data'];
        setIsLoadingTreatment = false;
        notifyListeners();
        return response;
      } else {
        setIsLoadingTreatment = false;
        notifyListeners();
        return response;
      }
    } catch (e) {
      return {
        "message": e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> addTreatment({
    required Map<String, dynamic> data,
  }) async {
    try {
      setIsLoadingTreatment = true;
      data['invoice_id'] = _idInvoice.toString();
      if (data['photo'] == null) {
        var response = await EndPoint.addTreatment(
          data: data,
        );
        setIsLoadingTreatment = false;
        if (response['meta']['code'] == 200) {
          notifyListeners();
          return response;
        } else {
          notifyListeners();
          return response;
        }
      } else {
        String url = '${Network().baseUrl}treatment';
        var tokenAuth = await Storage.get(tokenStorageKey);
        var headers = {
          'Authorization': "Bearer $tokenAuth",
        };

        var request = http.MultipartRequest('POST', Uri.parse(url));

        request.files
            .add(await http.MultipartFile.fromPath('photo', data['photo']));

        request.headers.addAll(headers);

        request.fields["invoice_id"] = _idInvoice.toString();
        request.fields["price"] = data['price'].toString();
        request.fields["description"] = data['description'].toString();

        var response = await request.send().then(
              (result) => http.Response.fromStream(result).then(
                (response) {
                  if (response.statusCode == 200) {
                    setIsLoadingTreatment = false;
                    notifyListeners();
                    return response;
                  } else {
                    setIsLoadingTreatment = false;
                    notifyListeners();
                    print(response.body);
                  }
                },
              ),
            );

        return jsonDecode(response!.body);
      }
    } catch (e) {
      return {
        "message": e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> listPrescription() async {
    try {
      setIsLoadingPrescription = true;
      var response = await EndPoint.getPrescription(
        invoiceId: _idInvoice,
      );
      if (response['meta']['code'] == 200) {
        setPrescription = response['data']['data'];
        setIsLoadingPrescription = false;
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

  Future<Map<String, dynamic>> listControlSchedule() async {
    try {
      setIsLoadingControlSchedule = true;
      var response = await EndPoint.getControlSchedule(
        invoiceId: _idInvoice,
      );
      if (response['meta']['code'] == 200) {
        setControlSchedule = response['data']['data'];
        setIsLoadingControlSchedule = false;
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

  Future<Map<String, dynamic>> addControlSchedule({
    required Map<String, dynamic> data,
  }) async {
    try {
      setIsLoadingControlSchedule = true;
      data['invoice_id'] = _idInvoice;
      var response = await EndPoint.addControlSchedule(
        data: data,
      );
      if (response['meta']['code'] == 200) {
        setIsLoadingControlSchedule = false;
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

  Future<Map<String, dynamic>> updateMedic() async {
    try {
      setIsLoadingMedic = true;
      var response = await EndPoint.updateMedic(
        inpatientId: setItemMedicalRecord['invoice']['inpatient_id'].toString(),
      );
      if (response['meta']['code'] == 200) {
        setIsLoadingMedic = false;
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

  Future<Map<String, dynamic>> addMedicalRecord({
    required Map<String, dynamic> data,
  }) async {
    try {
      setIsLoadingMedic = true;
      var response = await EndPoint.addMedicalRecord(
        data: data,
      );
      if (response['meta']['code'] == 200) {
        setIsLoadingMedic = false;
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

  Future<Map<String, dynamic>> itemMedicalRecord({
    required Map<String, dynamic> data,
  }) async {
    try {
      setItemMedicalRecord = data;
      notifyListeners();
      return data;
    } catch (e) {
      return {
        "message": e.toString(),
      };
    }
  }

  Future<String> setIdInvoice({
    required String idInvoice,
  }) async {
    try {
      _idInvoice = idInvoice;
      notifyListeners();
      return _idInvoice;
    } catch (e) {
      return e.toString();
    }
  }
}
