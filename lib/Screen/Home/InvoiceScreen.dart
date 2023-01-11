import 'package:flutter/material.dart';
import 'package:medic_petcare/Provider/MedicalRecordProvider.dart';
import 'package:medic_petcare/Routes/Routes.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/CardMedicalRecord.dart';
import 'package:medic_petcare/Widgets/EmptyWidget.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/InputWidget.dart';
import 'package:medic_petcare/Widgets/LoadingWidget.dart';
import 'package:provider/provider.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderWidget(
        title: "Daftar Tagihan",
        useBackButton: false,
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: 24,
              ),
              child: InputWidget(
                title: "hidden",
                hintText: "Cari tagihan . . .",
                iconLeft: Icons.search_rounded,
              ),
            ),
            Consumer<MedicalRecordProvider>(
              builder: (context, value, child) {
                return value.isLoadingMedic
                    ? CircleLoadingWidget()
                    : value.getMedicalRecordHistory.isEmpty
                        ? EmptyWidget(
                            text: "Tidak ada data Tagihan",
                          )
                        : ListView.builder(
                            itemCount: value.getMedicalRecordHistory.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Provider.of<MedicalRecordProvider>(
                                    context,
                                    listen: false,
                                  ).setIdInvoice(
                                    idInvoice: value
                                        .getMedicalRecordHistory[index]
                                            ['medical_record']['inpatients']
                                            ['invoice']['id']
                                        .toString(),
                                  );
                                  Provider.of<MedicalRecordProvider>(
                                    context,
                                    listen: false,
                                  ).itemMedicalRecord(
                                    data: value.getMedicalRecordHistory[index]
                                        ['medical_record']['inpatients'],
                                  );
                                  Navigator.pushNamed(
                                    context,
                                    Routes.detailInvoiceScreen,
                                  );
                                },
                                child: CardMedialRecord(
                                  data: value.getMedicalRecordHistory[index],
                                ),
                              );
                            },
                          );
              },
            ),
          ],
        ),
      ),
    );
  }
}
