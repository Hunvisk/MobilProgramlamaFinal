import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/storage.dart';


class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  loadApp() async {
    final storage = Storage();
    final firstLaunch = await storage.isFirstLaunch();

    if (firstLaunch)
    {
      GoRouter.of(context).replace("/Boarding");
    }
    else
    {
      GoRouter.of(context).replace("/Login");
    }
  }

  @override
  void initState()
  {
    super.initState();
    loadApp();
  }

  @override
  Widget build(BuildContext context)
  {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}