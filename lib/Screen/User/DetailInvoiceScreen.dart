import 'package:flutter/material.dart';
import 'package:medic_petcare/Utils/Images.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/ImageWidget.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';

class DetailInvoiceScreen extends StatelessWidget {
  const DetailInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        title: "Tagihan",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: ImageWidget(
                image: circleDollarIcon,
                height: 40,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: TextWidget(
              label: "Detail Tagihan",
              type: "s3",
              weight: "bold",
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  label: "Kode Transaksi",
                  weight: "medium",
                ),
                TextWidget(
                  label: "TR2789",
                  type: "b2",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  label: "Tanggal Masuk",
                  weight: "medium",
                ),
                TextWidget(
                  label: "24-11-2022",
                  type: "b2",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  label: "Tanggal Keluar",
                  weight: "medium",
                ),
                TextWidget(
                  label: "30-11-2022",
                  type: "b2",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  label: "Nama Pasien",
                  weight: "medium",
                ),
                TextWidget(
                  label: "Bombom - Anjing",
                  type: "b2",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  label: "Status",
                  weight: "medium",
                ),
                TextWidget(
                  label: "Rawat inap",
                  type: "b2",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: TextWidget(
              label: "Biaya Perawatan",
              weight: "medium",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  label: "5x Lab Darah",
                  type: "b2",
                ),
                TextWidget(
                  label: "Rp. 120.000",
                  type: "b2",
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  label: "5x Lab Darah",
                  type: "b2",
                ),
                TextWidget(
                  label: "Rp. 120.000",
                  type: "b2",
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  label: "5x Lab Darah",
                  type: "b2",
                ),
                TextWidget(
                  label: "Rp. 120.000",
                  type: "b2",
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: TextWidget(
              label: "Daftar Obat",
              weight: "medium",
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  label: "1x Fluffy - vitamin kucing",
                  type: "b2",
                ),
                TextWidget(
                  label: "Rp. 70.000",
                  type: "b2",
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: TextWidget(
              label: "Varian 100g",
              type: "b2",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  label: "1x Fluffy - vitamin kucing",
                  type: "b2",
                ),
                TextWidget(
                  label: "Rp. 70.000",
                  type: "b2",
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: TextWidget(
              label: "Varian 100g",
              type: "b2",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  label: "1x Fluffy - vitamin kucing",
                  type: "b2",
                ),
                TextWidget(
                  label: "Rp. 70.000",
                  type: "b2",
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: TextWidget(
              label: "Varian 100g",
              type: "b2",
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            height: 58,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.cyan.shade50,
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  label: "Total Pembayaran",
                  weight: "medium",
                ),
                TextWidget(
                  label: "Rp. 250.000",
                  type: "s3",
                  weight: "bold",
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
