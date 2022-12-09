import 'package:medic_petcare/Routes/Routes.dart';
import 'package:medic_petcare/Utils/Images.dart';

List<Map<String, dynamic>> listJadwalControl = [
  {
    "id": 1,
    "name": "Pasien 1",
    "date": "Kamis, 06 Oktober 2022",
    "time": "19:00",
    "image":
        "https://images.unsplash.com/photo-1669173034257-aabc8ebb8f4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
  },
  {
    "id": 2,
    "name": "Pasien 2",
    "date": "Jum'at, 07 Oktober 2022",
    "time": "18:00",
    "image":
        "https://images.unsplash.com/photo-1669173034257-aabc8ebb8f4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
  },
  {
    "id": 3,
    "name": "Pasien 3",
    "date": "Jum'at, 10 Oktober 2022",
    "time": "20:00",
    "image":
        "https://images.unsplash.com/photo-1669173034257-aabc8ebb8f4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
  }
];
List<Map<String, dynamic>> listJadwalPraktik = [
  {
    "id": 1,
    "hari": "Senin",
    "date": "06 Nov 2022",
    "description": "Praktik dimulai dan diakhiri\n07.00 - 17.00 WITA",
  },
  {
    "id": 2,
    "hari": "Senin",
    "date": "06 Okt 2022",
    "description": "Praktik dimulai dan diakhiri\n07.00 - 17.00 WITA",
  },
  {
    "id": 3,
    "hari": "Senin",
    "date": "06 Okt 2022",
    "description": "Praktik dimulai dan diakhiri\n07.00 - 17.00 WITA",
  },
];
List<Map<String, dynamic>> listFeatures = [
  {
    "id": 1,
    "label": "Jadwal Kontrol",
    "onpress": Routes.listcontrolSceduleScreen,
    "icon": timeIcon,
  },
  {
    "id": 2,
    "label": "Jadwal Praktik",
    "onpress": Routes.practiceScheduleLandingScreen,
    "icon": calendarIcon,
  },
  {
    "id": 3,
    "label": "Daftar Antrian",
    "onpress": Routes.listcontrolSceduleScreen,
    "icon": documentIcon,
  },
  {
    "id": 4,
    "label": "Tagihan",
    "onpress": Routes.listInvoiceScreen,
    "icon": dollarIcon,
  },
];
List<Map<String, dynamic>> listJadwalUser = [
  {
    "id": 1,
    "name": "Slamet Nurdin",
    "email": "slamet@gmail.com",
    "nomor": "08239489202",
    "image":
        "https://images.unsplash.com/photo-1669307412139-1c95394a94c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
  },
  {
    "id": 2,
    "name": "Maryoto",
    "email": "maryoto@gmail.com",
    "nomor": "08239489202",
    "image":
        "https://images.unsplash.com/photo-1669307412139-1c95394a94c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
  },
  {
    "id": 3,
    "name": "Nur Maryani",
    "email": "nrmryn@gmail.com",
    "nomor": "08239489202",
    "image":
        "https://images.unsplash.com/photo-1669307412139-1c95394a94c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60"
  },
  {
    "id": 4,
    "name": "Slamet Nurdin",
    "email": "slamet@gmail.com",
    "nomor": "08239489202",
    "image":
        "https://images.unsplash.com/photo-1669307412139-1c95394a94c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
  },
  {
    "id": 5,
    "name": "Maryoto",
    "email": "maryoto@gmail.com",
    "nomor": "08239489202",
    "image":
        "https://images.unsplash.com/photo-1669307412139-1c95394a94c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
  },
  {
    "id": 6,
    "name": "Nur Maryani",
    "email": "nrmryn@gmail.com",
    "nomor": "08239489202",
    "image":
        "https://images.unsplash.com/photo-1669307412139-1c95394a94c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60"
  }
];
List<Map<String, dynamic>> listJadwalDetailUser = [
  {
    "id": 1,
    "name": "Chiyoo",
    "jenis": "Kucing Alaska",
    "gender": "Jantan / 2 bulan",
    "image": petIcon,
  },
  {
    "id": 2,
    "name": "Chiyoo",
    "jenis": "Kucing Alaska",
    "gender": "Jantan / 2 bulan",
    "image": petIcon,
  },
  {
    "id": 3,
    "name": "Chiyoo",
    "jenis": "Kucing Alaska",
    "gender": "Jantan / 2 bulan",
    "image": petIcon,
  },
  {
    "id": 4,
    "name": "Chiyoo",
    "jenis": "Kucing Alaska",
    "gender": "Jantan / 2 bulan",
    "image": petIcon,
  },
  {
    "id": 5,
    "name": "Chiyoo",
    "jenis": "Kucing Alaska",
    "gender": "Jantan / 2 bulan",
    "image": petIcon,
  },
];
List<Map<String, dynamic>> listTagihan = [
  {
    "id": 1,
    "name": "Bombom - Anjing",
    "kode": "TR2789",
    "sampai": "27-11-2022",
    "dengan": "30-11-2022",
    "onpress": Routes.detailInvoiceScreen,
  },
  {
    "id": 2,
    "name": "Bombom - Anjing",
    "kode": "TR2789",
    "sampai": "27-11-2022",
    "dengan": "30-11-2022",
    "onpress": Routes.detailInvoiceScreen,
  },
  {
    "id": 3,
    "name": "Chiyoo - Anjing",
    "kode": "TR2789",
    "sampai": "27-11-2022",
    "dengan": "30-11-2022",
    "onpress": Routes.detailInvoiceScreen,
  },
  {
    "id": 4,
    "name": "Chiyoo - Anjing",
    "kode": "TR2789",
    "sampai": "27-11-2022",
    "dengan": "30-11-2022",
    "onpress": Routes.detailInvoiceScreen,
  },
  {
    "id": 5,
    "name": "Bombom - Anjing",
    "kode": "TR2789",
    "sampai": "27-11-2022",
    "dengan": "30-11-2022",
    "onpress": Routes.detailInvoiceScreen,
  },
  {
    "id": 6,
    "name": "Bombom - Anjing",
    "kode": "TR2789",
    "sampai": "27-11-2022",
    "dengan": "30-11-2022",
    "onpress": Routes.detailInvoiceScreen,
  },
];
List<Map<String, dynamic>> listRawatInap = [
  {
    "id": 1,
    "operasi": "Operasi Kecil - ",
    "rawat": "Rawat Jalan",
    "hewan": "Bombom",
    "sampai": "27-11-2022",
    "dengan": "30-11-2022",
  },
  {
    "id": 2,
    "operasi": "Konsultasi kesehatan - ",
    "rawat": "Rawat Jalan",
    "hewan": "Bombom",
    "sampai": "27-11-2022",
    "dengan": "30-11-2022",
  },
  {
    "id": 3,
    "operasi": "Operasi Kecil - ",
    "rawat": "Rawat inap",
    "hewan": "Bombom",
    "sampai": "27-11-2022",
    "dengan": "30-11-2022",
  },
  {
    "id": 4,
    "operasi": "Operasi Kecil - ",
    "rawat": "Rawat inap",
    "hewan": "Bombom",
    "sampai": "27-11-2022",
    "dengan": "30-11-2022",
  },
  {
    "id": 5,
    "operasi": "Operasi Kecil - ",
    "rawat": "Rawat Jalan",
    "hewan": "Bombom",
    "sampai": "27-11-2022",
    "dengan": "30-11-2022",
  },
  {
    "id": 6,
    "operasi": "Operasi Kecil - ",
    "rawat": "Rawat Jalan",
    "hewan": "Bombom",
    "sampai": "27-11-2022",
    "dengan": "30-11-2022",
  },
  {
    "id": 7,
    "operasi": "Operasi Kecil - ",
    "rawat": "Rawat Jalan",
    "hewan": "Bombom",
    "sampai": "27-11-2022",
    "dengan": "30-11-2022",
  },
];
List<Map<String, dynamic>> listMedicalRecord = [
  {
    "id": 1,
    "name": "Chiyoo - ",
    "jenis": "Kucing Alaska",
    "penyakit": "Diare + muntaber",
    "tanggal": "27-11-2022",
    "image": maleIcon,
    "rawat": "Rawat jalan",
  },
  {
    "id": 2,
    "name": "Bombom - ",
    "jenis": "Kucing Alaska",
    "penyakit": "Diare + muntaber",
    "tanggal": "27-11-2022",
    "image": femaleIcon,
    "rawat": "Rawat inap",
  },
  {
    "id": 3,
    "name": "Bombom - ",
    "jenis": "Kucing Alaska",
    "penyakit": "Diare + muntaber",
    "tanggal": "27-11-2022",
    "image": femaleIcon,
    "rawat": "Rawat inap",
  },
  {
    "id": 4,
    "name": "Chiyoo - ",
    "jenis": "Kucing Alaska",
    "penyakit": "Diare + muntaber",
    "tanggal": "27-11-2022",
    "image": maleIcon,
    "rawat": "Rawat jalan",
  },
  {
    "id": 5,
    "name": "Chiyoo - ",
    "jenis": "Kucing Alaska",
    "penyakit": "Diare + muntaber",
    "tanggal": "27-11-2022",
    "image": maleIcon,
    "rawat": "Rawat jalan",
  },
];
