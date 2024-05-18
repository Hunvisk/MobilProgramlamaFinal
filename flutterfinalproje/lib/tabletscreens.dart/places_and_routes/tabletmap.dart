
import 'package:flutter/material.dart';

class TabletMap extends StatefulWidget {
  const TabletMap({Key? key}) : super(key: key);

  @override
  State<TabletMap> createState() => _MyMapState();
}

class _MyMapState extends State<TabletMap> {

  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
   
      
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body: Mapbody(),
      
    );
  }
}

class Mapbody extends StatelessWidget {
  const Mapbody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("data");
  }
}



