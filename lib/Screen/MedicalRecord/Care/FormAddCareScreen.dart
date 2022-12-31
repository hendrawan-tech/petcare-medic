import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:medic_petcare/Provider/MedicalRecordProvider.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Snackbar.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Utils/Utils.dart';
import 'package:medic_petcare/Widgets/ButtonWidget.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/InputWidget.dart';
import 'package:medic_petcare/Widgets/PickDateWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';
import 'package:provider/provider.dart';

class FormAddCareScreen extends StatefulWidget {
  const FormAddCareScreen({Key? key}) : super(key: key);

  @override
  State<FormAddCareScreen> createState() => _FormAddCareScreenState();
}

class _FormAddCareScreenState extends State<FormAddCareScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  String errndesc = "", errprice = "";
  bool isLoading = false;
  File? image;

  Map<String, dynamic> form = {
    "date": "",
    "month": "",
    "year": "",
  };

  String selectedDate = "";

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
      errprice = "";
      isLoading = true;
    });
    if (descController.text.isEmpty) {
      errndesc = "Deskripsi Perawatan wajib diisi";
      valid = false;
      isLoading = false;
    }
    if (priceController.text.isEmpty) {
      errprice = "Harga Perawatan wajib diisi";
      valid = false;
      isLoading = false;
    }
    if (valid) {
      var data = {
        "price": priceController.text,
        "description": descController.text,
      };
      if (image.runtimeType != Null) {
        data.addAll({
          'photo': image!.path,
        });
      }
      await Provider.of<MedicalRecordProvider>(
        context,
        listen: false,
      ).addTreatment(data: data).then((value) {
        setState(() {
          isLoading = false;
        });
        if (value['meta']['code'] == 200) {
          Navigator.pop(
            context,
          );
          Provider.of<MedicalRecordProvider>(
            context,
            listen: false,
          ).listTreatment();
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

  onChangePrice(String newText) {
    if (priceController.text.isNotEmpty && newText.isNotEmpty) {
      setState(() {
        errprice = "";
      });
    } else {
      setState(() {
        errprice = "Harga Perawatan wajib diisi";
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

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? imagePicked = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
      );
      setState(() {
        image = File(imagePicked!.path);
      });
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderWidget(
        title: "Tambah Perawatan",
      ),
      backgroundColor: whiteColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    title: "Harga Perawatan",
                    hintText: "",
                    controller: priceController,
                    type: TextInputType.number,
                    errText: errprice,
                    onChanged: onChangePrice,
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
                  Container(
                    margin: EdgeInsets.only(
                      top: defaultMargin,
                    ),
                    child: TextWidget(
                      label: "Gambar (opsional)",
                      type: 'b2',
                      weight: 'medium',
                      color: fontPrimaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await getImage();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      margin: const EdgeInsets.only(
                        top: 8,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultMargin,
                        vertical: 24,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: borderColor,
                        ),
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                      child: Center(
                        child: image != null
                            ? Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: borderColor,
                                  ),
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                ),
                                width: double.infinity,
                                height: 300,
                                child: Image.file(
                                  image!,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : ImageWidget(
                                height: 50,
                                image: addImageIcon,
                              ),
                      ),
                    ),
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
