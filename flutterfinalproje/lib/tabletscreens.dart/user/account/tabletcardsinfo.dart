
import 'package:flutter/material.dart';
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
        body:const TabletCardsInfoBody(), // Burada içerik belirtilmemiş, düzeltilmeli.
      ),
    );
    
  }
  }

class TabletCardsInfoBody extends StatelessWidget {
  const TabletCardsInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("data");
  }
}