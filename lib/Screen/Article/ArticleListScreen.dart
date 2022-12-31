import 'package:flutter/material.dart';
import 'package:medic_petcare/Provider/ArticleProvider.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/ArticleCardWidget.dart';
import 'package:medic_petcare/Widgets/HeaderWidget.dart';
import 'package:medic_petcare/Widgets/LoadingWidget.dart';
import 'package:provider/provider.dart';

class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({Key? key}) : super(key: key);

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    Provider.of<ArticleProvider>(
      context,
      listen: false,
    ).article();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const HeaderWidget(
        title: "Artikel Menarik",
      ),
      body: SingleChildScrollView(
        child: Consumer<ArticleProvider>(
          builder: (context, value, child) {
            return value.isLoading
                ? CircleLoadingWidget()
                : ListView.builder(
                    itemCount: value.getArticle.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                      top: 8,
                      left: defaultMargin,
                      right: defaultMargin,
                      bottom: 24,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ArticleCardWidget(
                        data: value.getArticle[index],
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
