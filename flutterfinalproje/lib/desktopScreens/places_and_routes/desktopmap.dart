// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DesktopMap extends StatefulWidget {
  const DesktopMap({Key? key}) : super(key: key);

  @override
  State<DesktopMap> createState() => _MyMapState();
}

class _MyMapState extends State<DesktopMap> {

  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
   
      
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        
        body: mapbody(),
        
      ),
    );
  }
}

class mapbody extends StatelessWidget {
  const mapbody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}



