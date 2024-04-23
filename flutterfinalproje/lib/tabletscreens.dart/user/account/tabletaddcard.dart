// ignore_for_file: file_names, prefer_const_constructors, unnecessary_import, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';

class TabletAddCard extends StatefulWidget {
  const TabletAddCard({Key? key}) : super(key: key);

  @override
  State<TabletAddCard> createState() => _TabletAddCardState();
}

class _TabletAddCardState extends State<TabletAddCard> {

 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: MyAppBar(title: "title"),
        body:tabletAddCard(), // Burada içerik belirtilmemiş, düzeltilmeli.
      ),
    );
    
  }
  }

class tabletAddCard extends StatelessWidget {
  const tabletAddCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}