import 'package:flutter/material.dart';


class DesktopSelectedProducts extends StatefulWidget {
  const DesktopSelectedProducts({Key? key}) : super(key: key);

  @override
  State<DesktopSelectedProducts> createState() => DesktopSelectedProductsState();
}

class DesktopSelectedProductsState extends State<DesktopSelectedProducts> {

  
   

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DesktopSelectedProductsBody(),
    );
  }
}

class DesktopSelectedProductsBody extends StatelessWidget {
  const DesktopSelectedProductsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("routes page");
  }
}