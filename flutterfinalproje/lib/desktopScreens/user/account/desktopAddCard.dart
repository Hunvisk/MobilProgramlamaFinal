// ignore_for_file: file_names, prefer_const_constructors, unnecessary_import, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';

class DesktopAddCard extends StatefulWidget {
  const DesktopAddCard({Key? key}) : super(key: key);

  @override
  State<DesktopAddCard> createState() => _DesktopAddCardState();
}

class _DesktopAddCardState extends State<DesktopAddCard> {

 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: MyAppBar(title: "title"),
        body:desktopAddCard(), // Burada içerik belirtilmemiş, düzeltilmeli.
      ),
    );
    
  }
  }

class desktopAddCard extends StatelessWidget {
  const desktopAddCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}