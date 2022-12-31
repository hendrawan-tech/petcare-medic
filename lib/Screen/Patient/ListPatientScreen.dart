import 'package:flutter/material.dart';
import 'package:medic_petcare/Provider/PatientProvider.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Static.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/CardDetailUser.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/InputWidget.dart';
import 'package:medic_petcare/Widgets/LoadingWidget.dart';
import 'package:provider/provider.dart';

class ListPatientScreen extends StatefulWidget {
  const ListPatientScreen({super.key});

  @override
  State<ListPatientScreen> createState() => _ListPatientScreenState();
}

class _ListPatientScreenState extends State<ListPatientScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    Provider.of<PatientProvider>(
      context,
      listen: false,
    ).listPatient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const HeaderWidget(
        title: "Daftar Pasien",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(
                defaultMargin,
              ),
              child: InputWidget(
                title: "hidden",
                hintText: "Cari pasien . . .",
                iconLeft: Icons.search,
              ),
            ),
            Consumer<PatientProvider>(
              builder: (context, value, child) {
                return value.isLoading
                    ? ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultMargin,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(
                              bottom: 12,
                            ),
                            child: LoadingCardPatient(),
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: value.getPatients.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultMargin,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CardDetailUser(
                            data: value.getPatients[index],
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
