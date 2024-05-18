
import 'package:flutter/material.dart';


class TabletSelectedProducts extends StatefulWidget {
  const TabletSelectedProducts({Key? key}) : super(key: key);

  @override
  State<TabletSelectedProducts> createState() => TabletSelectedProductsState();
}

class TabletSelectedProductsState extends State<TabletSelectedProducts> {

  
   

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TabletSelectedProductsBody(),
    );
  }
}

class TabletSelectedProductsBody extends StatelessWidget {
  const TabletSelectedProductsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("routes page");
  }
}