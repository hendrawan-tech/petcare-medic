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

  static urlArticle() async {
    return Network().get(
      url: 'articles',
    );
  }

  static urlScheduleDoctor() async {
    return Network().get(
      url: 'schedules/doctor',
    );
  }

  static listPatient() async {
    return Network().get(
      url: 'patients',
    );
  }

  static listRegistration({
    String? limit,
  }) async {
    return Network().get(
      url: 'registration?limit=$limit&flag=doctor',
    );
  }

  static addMedicalRecord({
    required Map<String, dynamic> data,
  }) async {
    return Network().post(
      url: 'medical-record',
      body: data,
    );
  }

  static getMedicalRecord() async {
    return Network().get(
      url: 'medical-record',
    );
  }

  static getTreatment({
    String? limit,
    required String invoiceId,
  }) async {
    return Network().get(
      url: 'treatment?invoice_id=$invoiceId',
    );
  }

  static addTreatment({
    required Map<String, dynamic> data,
  }) async {
    return Network().post(
      url: 'treatment',
      body: data,
    );
  }

  static getControlSchedule({
    String? limit,
    required String invoiceId,
  }) async {
    return Network().get(
      url: 'control-schedule?invoice_id=$invoiceId',
    );
  }

  static getPrescription({
    String? limit,
    required String invoiceId,
  }) async {
    return Network().get(
      url: 'prescription?invoice_id=$invoiceId',
    );
  }

  static getDrug({
    String? limit,
  }) async {
    return Network().get(
      url: 'products',
    );
  }

  static postDrug({
    required String invoiceId,
    required List data,
  }) async {
    return Network().post(
      url: 'prescription/$invoiceId',
      isList: true,
      list: data,
    );
  }
}
