import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/mybottomnavbar.dart';

class DashboardScreen extends StatefulWidget {
  final StatefulNavigationShell child;

  const DashboardScreen({Key? key, required this.child}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: MyBottomNavBar(child: widget.child,),
    );
  }
}