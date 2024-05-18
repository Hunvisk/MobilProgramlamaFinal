
import 'package:flutter/material.dart';


class TabletProducts extends StatefulWidget {
  const TabletProducts({Key? key}) : super(key: key);

  @override
  State<TabletProducts> createState() => _TabletProductsState();
}

class _TabletProductsState extends State<TabletProducts> {

 
  

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
          body: TabletProduct(),
        );
  }
}

class TabletProduct extends StatelessWidget {
  const TabletProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("data");
  }
}

