// ignore_for_file: file_names, unnecessary_import, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterfinalproje/desktopScreens/user/account/desktopAddCard.dart';

class DesktopCardsInfo extends StatefulWidget {
  const DesktopCardsInfo({Key? key}) : super(key: key);

  @override
  State<DesktopAddCard> createState() => _DesktopAddCardState();
}

class _DesktopAddCardState extends State<DesktopAddCard> {

 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body:desktopCardsInfo(), // Burada içerik belirtilmemiş, düzeltilmeli.
      ),
    );
    
  }
  }

class desktopCardsInfo extends StatelessWidget {
  const desktopCardsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}