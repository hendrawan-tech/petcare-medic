import 'package:intl/intl.dart';
import 'package:medic_petcare/Config/Network.dart';

String getImageUrl(String name) {
  try {
    if (name.contains('http')) {
      return name;
    } else {
      return Network().photoUrl + name;
    }
  } catch (e) {
    return e.toString();
  }
}

String formatPrice({
  String amount = "0",
  String awalan = "Rp",
}) {
  try {
    final oCcy = NumberFormat("#,##0", "id_ID");
    if (awalan.isEmpty) {
      return oCcy.format(double.parse(amount));
    } else {
      return "$awalan ${oCcy.format(double.parse(amount))}";
    }
  } catch (e) {
    return amount;
  }
}

String parseMounth(String tanggal) {
  DateTime dateTime = DateFormat("yyyy-MM-dd").parse(tanggal);

  var m = DateFormat('MM').format(dateTime);
  var d = DateFormat('dd').format(dateTime).toString();
  var Y = DateFormat('yyyy').format(dateTime).toString();
  var month = "";
  switch (m) {
    case '01':
      {
        month = "Januari";
      }
      break;
    case '02':
      {
        month = "Februari";
      }
      break;
    case '03':
      {
        month = "Maret";
      }
      break;
    case '04':
      {
        month = "April";
      }
      break;
    case '05':
      {
        month = "Mei";
      }
      break;
    case '06':
      {
        month = "Juni";
      }
      break;
    case '07':
      {
        month = "Juli";
      }
      break;
    case '08':
      {
        month = "Agustus";
      }
      break;
    case '09':
      {
        month = "September";
      }
      break;
    case '10':
      {
        month = "Oktober";
      }
      break;
    case '11':
      {
        month = "November";
      }
      break;
    case '12':
      {
        month = "Desember";
      }
      break;
  }
  return "$d $month $Y";
}

String getMounth(String tanggal) {
  DateTime dateTime = DateFormat("yyyy-MM-dd").parse(tanggal);

  var m = DateFormat('MM').format(dateTime);
  var month = "";
  switch (m) {
    case '01':
      {
        month = "Jan";
      }
      break;
    case '02':
      {
        month = "Feb";
      }
      break;
    case '03':
      {
        month = "Mar";
      }
      break;
    case '04':
      {
        month = "Apr";
      }
      break;
    case '05':
      {
        month = "Mei";
      }
      break;
    case '06':
      {
        month = "Jun";
      }
      break;
    case '07':
      {
        month = "Jul";
      }
      break;
    case '08':
      {
        month = "Agu";
      }
      break;
    case '09':
      {
        month = "Sep";
      }
      break;
    case '10':
      {
        month = "Okt";
      }
      break;
    case '11':
      {
        month = "Nov";
      }
      break;
    case '12':
      {
        month = "Des";
      }
      break;
  }
  return month;
}

String parseDay(String tanggal) {
  DateTime dateTime = DateFormat("yyyy-MM-dd").parse(tanggal);

  var day = DateFormat('EEEE').format(dateTime);
  var hari = "";
  switch (day) {
    case 'Sunday':
      {
        hari = "Minggu";
      }
      break;
    case 'Monday':
      {
        hari = "Senin";
      }
      break;
    case 'Tuesday':
      {
        hari = "Selasa";
      }
      break;
    case 'Wednesday':
      {
        hari = "Rabu";
      }
      break;
    case 'Thursday':
      {
        hari = "Kamis";
      }
      break;
    case 'Friday':
      {
        hari = "Jumat";
      }
      break;
    case 'Saturday':
      {
        hari = "Sabtu";
      }
      break;
  }
  return hari;
}

String formatDateInput(tgl) {
  try {
    var date = tgl.toString().split(" ");
    var bln = [
      '',
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];

    var bulan = date[0].toString().split('-');
    String tanggal = '${bulan[2]} ${bln[int.parse(bulan[1])]} ${bulan[0]}';
    return tanggal;
  } catch (e) {
    return tgl.toString();
  }
}
