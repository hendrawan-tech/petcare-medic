import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Utils/Utils.dart';
import 'package:medic_petcare/Widgets/ButtonWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class PickDateWidget extends StatefulWidget {
  final Map<String, dynamic> formData;
  final Function callback;
  const PickDateWidget({
    Key? key,
    required this.formData,
    required this.callback,
  }) : super(key: key);

  @override
  State<PickDateWidget> createState() => _PickDateWidgetState();
}

class _PickDateWidgetState extends State<PickDateWidget> {
  DateTime firstDate = DateTime(
        DateTime.now().year,
        DateTime.now().month,
      ),
      lastDate = DateTime(DateTime.now().year + 10, 1);
  int day = 1, year = DateTime.now().year, month = 1;
  List years = [], days = [];
  Map<String, dynamic> tmpForm = {
    "date": "",
    "month": "",
    "year": "",
  };
  onChange(type, value) {
    setState(() {
      tmpForm[type] = value;
    });
    getData();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    setState(() {
      tmpForm = widget.formData;
      years = [];
      days = [];
    });
    DateTime firstDate = DateTime(
          DateTime.now().year,
          DateTime.now().month,
        ),
        lastDate = DateTime(DateTime.now().year + 10, 1);
    for (var year = firstDate.year; year <= lastDate.year; year++) {
      years.add(year);
    }
    int totalDays;
    if (tmpForm['date'] == "" && tmpForm['year'] == "") {
      totalDays = daysInMonth(DateTime(
        DateTime.now().year,
        DateTime.now().day,
      ));
    } else {
      totalDays = daysInMonth(
        DateTime(
          int.parse(
            tmpForm['year'].toString(),
          ),
          int.parse(
            tmpForm['month'].toString(),
          ),
        ),
      );
    }

    setState(() {
      days = List<int>.generate(totalDays, (i) => i + 1);
    });
  }

  int daysInMonth(DateTime date) {
    var firstDayThisMonth = DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 54,
            height: 5,
            margin: EdgeInsets.all(
              defaultMargin,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                100,
              ),
              color: borderColor,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: TextWidget(
            label: "Pilih Tanggal",
            weight: "bold",
            type: 's3',
            color: fontPrimaryColor,
          ),
        ),
        SizedBox(
          height: defaultMargin,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  TextWidget(
                    label: "Tanggal",
                    weight: "medium",
                    color: fontPrimaryColor,
                  ),
                  WheelOptionsWidget(
                    list: [for (var i = 1; i <= days.length; i++) i],
                    callback: (value) {
                      day = value;
                      onChange('date', value);
                    },
                    selected: tmpForm['date'] != ""
                        ? int.parse(
                            tmpForm['date'].toString(),
                          )
                        : null,
                  ),
                ],
              ),
              Column(
                children: [
                  TextWidget(
                    label: "Bulan",
                    weight: "medium",
                    color: fontPrimaryColor,
                  ),
                  WheelOptionsWidget(
                    list: [for (var i = 1; i <= 12; i++) i],
                    callback: (value) {
                      month = value;
                      day = 1;
                      onChange('month', value);
                      onChange('date', 1);
                    },
                    selected: tmpForm['month'] != ""
                        ? int.parse(
                            tmpForm['month'].toString(),
                          )
                        : null,
                    key: 'month',
                  ),
                ],
              ),
              Column(
                children: [
                  TextWidget(
                    label: "Tahun",
                    weight: "medium",
                    color: fontPrimaryColor,
                  ),
                  WheelOptionsWidget(
                    list: years,
                    callback: (value) {
                      year = value;
                      onChange('year', value);
                    },
                    selected: tmpForm['year'] != ""
                        ? int.parse(
                            tmpForm['year'].toString(),
                          )
                        : null,
                  ),
                ],
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(
              bottom: defaultMargin * 2,
              top: 24,
            ),
            height: 48,
            width: MediaQuery.of(context).size.width * 1 - (defaultMargin * 2),
            child: ButtonWidget(
              title: 'Simpan',
              theme: 'primary',
              onPressed: () {
                widget.callback(tmpForm);
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget WheelOptionsWidget({
    list,
    callback,
    selected,
    key,
  }) {
    selected = selected ?? list.first;

    return Container(
      constraints: const BoxConstraints(
        maxHeight: 140,
        maxWidth: 110,
      ),
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      child: ListWheelScrollView(
        controller:
            FixedExtentScrollController(initialItem: list.indexOf(selected)),
        itemExtent: 44,
        physics: const FixedExtentScrollPhysics(),
        squeeze: 1,
        onSelectedItemChanged: (index) {
          callback(list[index]);
        },
        children: <Widget>[
          ...list.map((index) {
            return Container(
              width: MediaQuery.of(context).size.width * .5 - 28,
              padding: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                bottom: 12,
                top: 6,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: selected == index ? borderColor : whiteColor,
                  ),
                  top: BorderSide(
                    color: selected == index ? borderColor : whiteColor,
                  ),
                ),
              ),
              child: Center(
                child: TextWidget(
                  label: key == 'month'
                      ? getMounth(
                          DateTime(year, index).toString(),
                        )
                      : "$index",
                  weight: 'medium',
                  type: 's1',
                  color: selected == index ? primaryColor : fontSecondaryColor,
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
