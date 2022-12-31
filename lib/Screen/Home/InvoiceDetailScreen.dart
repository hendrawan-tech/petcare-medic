import 'package:flutter/material.dart';
import 'package:medic_petcare/Screen/MedicalRecord/Review/StepReviewScreen.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';

class InvoiceDetailScreen extends StatefulWidget {
  const InvoiceDetailScreen({Key? key}) : super(key: key);

  @override
  State<InvoiceDetailScreen> createState() => _InvoiceDetailScreenState();
}

class _InvoiceDetailScreenState extends State<InvoiceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HeaderWidget(
        title: "Detail Tagihan",
      ),
      body: StepReviewScreen(),
    );
  }
}
