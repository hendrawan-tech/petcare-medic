import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:medic_petcare/Provider/MedicalRecordProvider.dart';
import 'package:medic_petcare/Utils/Snackbar.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Utils/Utils.dart';
import 'package:medic_petcare/Widgets/ButtonWidget.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/InputWidget.dart';
import 'package:medic_petcare/Widgets/PickDateWidget.dart';
import 'package:provider/provider.dart';

class StepAddControlSchedule extends StatefulWidget {
  const StepAddControlSchedule({Key? key}) : super(key: key);

  @override
  State<StepAddControlSchedule> createState() => _StepAddControlScheduleState();
}

class _StepAddControlScheduleState extends State<StepAddControlSchedule> {
  TextEditingController dateController = TextEditingController();
  TextEditingController descController = TextEditingController();

  Map<String, dynamic> form = {
    "date": "",
    "month": "",
    "year": "",
  };

  String errndesc = "", selectedDate = "";
  bool isLoading = false;

  backToMain(state) {
    setState(() {
      form = state;
    });

    SchedulerBinding.instance.addPostFrameCallback((_) {
      updateFormData();
    });
  }

  updateFormData() {
    setState(() {
      DateTime newDate = DateTime(
        int.parse(
          form['year'].toString(),
        ),
        int.parse(
          form['month'].toString(),
        ),
        int.parse(
          form['date'].toString(),
        ),
      );
      dateController.text = formatDateInput(newDate).toString();
      selectedDate = DateFormat("yyy-MM-dd").format(newDate).toString();
    });
  }

  handleSubmit() async {
    FocusManager.instance.primaryFocus?.unfocus();
    bool valid = true;
    setState(() {
      errndesc = "";
      isLoading = true;
    });
    if (descController.text.isEmpty) {
      errndesc = "Deskripsi Perawatan wajib diisi";
      valid = false;
      isLoading = false;
    }
    if (valid) {
      var data = {
        "date_control": selectedDate,
        "description": descController.text,
      };
      await Provider.of<MedicalRecordProvider>(
        context,
        listen: false,
      ).addControlSchedule(data: data).then((value) {
        setState(() {
          isLoading = false;
        });
          print(value);
        if (value['meta']['code'] == 200) {
          Navigator.pop(
            context,
          );
          Provider.of<MedicalRecordProvider>(
            context,
            listen: false,
          ).listControlSchedule();
        } else {
          setState(() {
            showSnackBar(
              context,
              value["meta"]['message'],
              type: 'error',
              position: 'TOP',
              duration: 1,
            );
          });
        }
      });
    }
  }

  onChangeDesc(String newText) {
    if (descController.text.isNotEmpty && newText.isNotEmpty) {
      setState(() {
        errndesc = "";
      });
    } else {
      setState(() {
        errndesc = "Deskripsi Perawatan wajib diisi";
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    var now = DateTime.now();
    setState(() {
      selectedDate = DateFormat("yyy-MM-dd").format(now);
      dateController.text = formatDateInput(now);
      form['date'] = DateTime.parse(selectedDate).day.toString();
      form['year'] = DateTime.parse(selectedDate).year.toString();
      form['month'] = DateTime.parse(selectedDate).month.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderWidget(
        title: "Tambah Jadwal Kontrol",
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: defaultMargin,
              ),
              child: Column(
                children: [
                  InputWidget(
                    title: "Tanggal Perawatan",
                    hintText: "",
                    readonly: true,
                    readOnlyColorCustom: whiteColor,
                    iconRight: Icons.keyboard_arrow_down_rounded,
                    controller: dateController,
                    onPress: () {
                      showModalDate();
                    },
                  ),
                  InputWidget(
                    title: "Deskripsi Perawatan",
                    hintText: "",
                    controller: descController,
                    errText: errndesc,
                    minLines: 8,
                    inputHeight: 96,
                    type: TextInputType.multiline,
                    maxChar: 255,
                    onChanged: onChangeDesc,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 24,
              horizontal: defaultMargin,
            ),
            width: double.infinity,
            child: ButtonWidget(
              title: "Tambah",
              isLoading: isLoading,
              theme: isLoading ? 'disable' : 'primary',
              onPressed: () {
                handleSubmit();
              },
            ),
          ),
        ],
      ),
    );
  }

  showModalDate() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      isDismissible: true,
      context: context,
      isScrollControlled: true,
      backgroundColor: whiteColor,
      clipBehavior: Clip.hardEdge,
      builder: (BuildContext context) {
        return ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 250,
          ),
          child: PickDateWidget(
            formData: form,
            callback: backToMain,
          ),
        );
      },
    );
  }
}
