import 'package:flutter/material.dart';
import 'package:medic_petcare/Provider/MedicalRecordProvider.dart';
import 'package:medic_petcare/Provider/RegistrationProvider.dart';
import 'package:medic_petcare/Routes/Routes.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Snackbar.dart';
import 'package:medic_petcare/Utils/Static.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Utils/Utils.dart';
import 'package:medic_petcare/Widgets/ButtonWidget.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/InputWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';
import 'package:provider/provider.dart';

class MedicalRecordFormScreen extends StatefulWidget {
  const MedicalRecordFormScreen({Key? key}) : super(key: key);

  @override
  State<MedicalRecordFormScreen> createState() =>
      _MedicalRecordFormScreenState();
}

class _MedicalRecordFormScreenState extends State<MedicalRecordFormScreen> {
  TextEditingController descController = TextEditingController(),
      anamnesaController = TextEditingController(),
      weightController = TextEditingController(),
      tempController = TextEditingController(),
      diagnosaController = TextEditingController(),
      theraphyController = TextEditingController();

  String errDesc = "",
      errAnamnesa = "",
      errWeight = "",
      errTemp = "",
      errDiagnosa = "",
      errTheraphy = "",
      gender = "Jantan";

  bool isLoading = false;

  handleValidate() async {
    FocusManager.instance.primaryFocus?.unfocus();
    bool valid = true;
    setState(() {
      errDesc = "";
      errAnamnesa = "";
      errWeight = "";
      errTemp = "";
      errDiagnosa = "";
      errTheraphy = "";
    });
    if (descController.text.isEmpty) {
      errDesc = "Keterangan wajib diisi";
      valid = false;
    }
    if (anamnesaController.text.isEmpty) {
      errAnamnesa = "Anamnesa wajib diisi";
      valid = false;
    }
    if (weightController.text.isEmpty) {
      errWeight = "Berat wajib diisi";
      valid = false;
    }
    if (tempController.text.isEmpty) {
      errTemp = "Temp wajib diisi";
      valid = false;
    }
    if (diagnosaController.text.isEmpty) {
      errDiagnosa = "Diagnosa wajib diisi";
      valid = false;
    }
    if (theraphyController.text.isEmpty) {
      errTheraphy = "Theraphy wajib diisi";
      valid = false;
    }
    if (valid) {
      _showModalCategory();
    }
  }

  handleSubmit(type) async {
    setState(() {
      isLoading = true;
    });
    Navigator.pop(context);
    var patient = Provider.of<RegistrationProvider>(
      context,
      listen: false,
    ).getRegistrationItem;
    Map<String, dynamic> data = {
      "diagnosis": diagnosaController.text,
      "anamnesa": anamnesaController.text,
      "therapy": theraphyController.text,
      "description": descController.text,
      "weight": weightController.text,
      "temp": tempController.text,
      "type": type,
      "registration_id": patient['id'],
    };
    await Provider.of<MedicalRecordProvider>(
      context,
      listen: false,
    )
        .addMedicalRecord(
      data: data,
    )
        .then(
      (value) {
        setState(() {
          isLoading = false;
        });
        if (value['meta']['code'] == 200) {
          Navigator.pushNamed(
            context,
            Routes.homeScreen,
            arguments: 1,
          );
        } else {
          setState(() {
            showSnackBar(
              context,
              "Failed request data",
              type: 'error',
              position: 'TOP',
              duration: 1,
            );
          });
        }
      },
    );
  }

  onChangeDesc(String newText) {
    if (descController.text.isNotEmpty && newText.isNotEmpty) {
      setState(() {
        errDesc = "";
      });
    } else {
      setState(() {
        errDesc = "Keterangan wajib diisi";
      });
    }
  }

  onChangeAnamnesa(String newText) {
    if (anamnesaController.text.isNotEmpty && newText.isNotEmpty) {
      setState(() {
        errAnamnesa = "";
      });
    } else {
      setState(() {
        errAnamnesa = "Anamnesa wajib diisi";
      });
    }
  }

  onChangeWeight(String newText) {
    if (weightController.text.isNotEmpty && newText.isNotEmpty) {
      setState(() {
        errWeight = " ";
      });
    } else {
      setState(() {
        errWeight = "Weight wajib diisi";
      });
    }
  }

  onChangeTemp(String newText) {
    if (tempController.text.isNotEmpty && newText.isNotEmpty) {
      setState(() {
        errTemp = " ";
      });
    } else {
      setState(() {
        errTemp = "Temp wajib diisi";
      });
    }
  }

  onChangeDiagnosa(String newText) {
    if (diagnosaController.text.isNotEmpty && newText.isNotEmpty) {
      setState(() {
        errDiagnosa = "";
      });
    } else {
      setState(() {
        errDiagnosa = "Diagnosa wajib diisi";
      });
    }
  }

  onChangeTheraphy(String newText) {
    if (theraphyController.text.isNotEmpty && newText.isNotEmpty) {
      setState(() {
        errTheraphy = "";
      });
    } else {
      setState(() {
        errTheraphy = "Theraphy wajib diisi";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var patient = Provider.of<RegistrationProvider>(
      context,
      listen: false,
    ).getRegistrationItem;
    return Scaffold(
      appBar: const HeaderWidget(
        title: "Rekam Medis",
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardPatient(
              data: patient,
            ),
            InputWidget(
              title: "Anamnesa",
              hintText: "",
              minLines: 8,
              inputHeight: 96,
              type: TextInputType.multiline,
              maxChar: 255,
              controller: anamnesaController,
              onChanged: onChangeAnamnesa,
              errText: errAnamnesa,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5 - 24,
                  child: InputWidget(
                    title: "Berat",
                    hintText: "Dalam satuan kg",
                    controller: weightController,
                    onChanged: onChangeWeight,
                    errText: errWeight,
                    maxChar: 3,
                    type: TextInputType.number,
                  ),
                ),
                SizedBox(
                  width: defaultMargin,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5 - 24,
                  child: InputWidget(
                    title: "Temp",
                    hintText: "Dalam satuan °C",
                    controller: tempController,
                    onChanged: onChangeTemp,
                    errText: errTemp,
                    maxChar: 3,
                    type: TextInputType.number,
                  ),
                ),
              ],
            ),
            InputWidget(
              title: "Diagnosa",
              hintText: "",
              minLines: 8,
              inputHeight: 96,
              type: TextInputType.multiline,
              maxChar: 255,
              controller: diagnosaController,
              onChanged: onChangeDiagnosa,
              errText: errDiagnosa,
            ),
            InputWidget(
              title: "Keterangan",
              hintText: "",
              controller: descController,
              onChanged: onChangeDesc,
              errText: errDesc,
              minLines: 8,
              inputHeight: 96,
              type: TextInputType.multiline,
              maxChar: 255,
            ),
            InputWidget(
              title: "Therapy",
              hintText: "",
              minLines: 8,
              inputHeight: 96,
              type: TextInputType.multiline,
              maxChar: 255,
              controller: theraphyController,
              onChanged: onChangeTheraphy,
              errText: errTheraphy,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: defaultMargin,
              ),
              width: double.infinity,
              child: ButtonWidget(
                title: "Lanjutkan",
                theme: isLoading ? 'disable' : 'primary',
                isLoading: isLoading,
                onPressed: () {
                  handleValidate();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _showModalCategory() {
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
        return BottomSheet(
          onClosing: () {},
          enableDrag: false,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, _) => Container(
                color: whiteColor,
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: defaultMargin,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 54,
                        height: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                          color: borderColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: defaultMargin,
                        bottom: 24,
                      ),
                      child: TextWidget(
                        label: "Pilih Kategori",
                        type: 's3',
                        weight: "bold",
                        color: fontPrimaryColor,
                      ),
                    ),
                    ListView.builder(
                      itemCount: categoryMedic.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            handleSubmit(
                              categoryMedic[index]['name'],
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: defaultMargin,
                              vertical: 14,
                            ),
                            margin: EdgeInsets.only(
                              bottom: defaultMargin,
                            ),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ImageWidget(
                                      image: categoryMedic[index]['icon'],
                                      width: 24,
                                      height: 24,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    TextWidget(
                                      label: categoryMedic[index]['name'],
                                      weight: 'medium',
                                      color: fontPrimaryColor,
                                    ),
                                  ],
                                ),
                                ImageWidget(
                                  image: arrowIcon,
                                  width: 15,
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CardPatient extends StatelessWidget {
  final Map data;
  const CardPatient({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
        color: primaryColor.withOpacity(.3),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: defaultMargin,
        vertical: 12,
      ),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(
              right: 12,
            ),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ImageWidget(
              image: getImageUrl(data['patient']['image']),
              height: 66,
              width: 66,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  label:
                      "${data['patient']["name"]} - ${data['patient']['species_patient']["name"]}",
                  weight: "bold",
                  color: fontPrimaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                  ),
                  child: TextWidget(
                    label: data['patient']["user"]['name'],
                    type: "b2",
                    color: fontSecondaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 2,
                  ),
                  child: TextWidget(
                    label: data['patient']["user"]['phone_number'],
                    type: "b2",
                    color: fontSecondaryColor,
                  ),
                ),
                TextWidget(
                  label: data['patient']["user"]['profession'] ?? '-',
                  type: "b2",
                  color: fontSecondaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
