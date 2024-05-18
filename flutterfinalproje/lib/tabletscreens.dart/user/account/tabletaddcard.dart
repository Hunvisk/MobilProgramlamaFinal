
import 'package:flutter/material.dart';
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
        appBar: const MyAppBar(title: "title"),
        body:const TabletAddCardBody(), // Burada içerik belirtilmemiş, düzeltilmeli.
      ),
    );
    
  }
}

class TabletAddCardBody extends StatelessWidget {
  const TabletAddCardBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("data");
  }
}