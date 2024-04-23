// ignore_for_file: file_names, unnecessary_import, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterfinalproje/tabletscreens.dart/user/account/tabletaddcard.dart';

class TabletCardsInfo extends StatefulWidget {
  const TabletCardsInfo({Key? key}) : super(key: key);

  @override
  State<TabletAddCard> createState() => _TabletAddCardState();
}

class _TabletAddCardState extends State<TabletAddCard> {

 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body:tabletCardsInfo(), // Burada içerik belirtilmemiş, düzeltilmeli.
      ),
    );
    
  }
  }

class tabletCardsInfo extends StatelessWidget {
  const tabletCardsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}