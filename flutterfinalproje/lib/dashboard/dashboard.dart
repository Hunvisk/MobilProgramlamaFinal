import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/mybottomnavbar.dart';

class DashboardScreen extends StatefulWidget {
  final Widget child;
  final GoRouterState state;
  const DashboardScreen({Key? key, required this.child, required this.state}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.child
      ),
      bottomNavigationBar: MyBottomNavBar(currentPath: widget.state.fullPath ?? ''),
    );
  }
}