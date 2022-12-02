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
    "onpress": Routes.controlSceduleScreen,
    "icon": timeIcon,
  },
  {
    "id": 2,
    "label": "Jadwal Praktik",
    "onpress": Routes.practiceScheduleScreen,
    "icon": calendarIcon,
  },
  {
    "id": 3,
    "label": "Daftar Antrian",
    "onpress": Routes.controlSceduleScreen,
    "icon": documentIcon,
  },
  {
    "id": 4,
    "label": "Tagihan",
    "onpress": Routes.controlSceduleScreen,
    "icon": dollarIcon,
  },
];
