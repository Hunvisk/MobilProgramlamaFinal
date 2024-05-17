// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:gap/gap.dart';
//import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

import '../../core/localizations.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context).getTranslate("about_app"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              Center(
                child: Image.asset(
                  "assets/images/logo/GR_Logo.png",
                  height: 150,
                  width: 150,
                ),
              ),
              Center(
                child: Text(
                  AppLocalizations.of(context).getTranslate("app_name"),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              const Gap(20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(
                        AppLocalizations.of(context)
                            .getTranslate("general_description"),
                      ),
                      _buildListItemWithIcon(
                        AppLocalizations.of(context)
                            .getTranslate("explanation_of_general_definition"),
                      ),
                      const Gap(20),
                      _buildSectionTitle(
                        AppLocalizations.of(context)
                            .getTranslate("about_app_title_1"),
                      ),
                      _buildListItemWithIcon(
                        AppLocalizations.of(context)
                            .getTranslate("description_about_app_1"),
                      ),
                      _buildListItemWithIcon(
                        AppLocalizations.of(context)
                            .getTranslate(" description_about_app_2"),
                      ),
                      _buildListItemWithIcon(
                        AppLocalizations.of(context)
                            .getTranslate("description_about_app_3"),
                      ),
                      const Gap(20),
                      _buildSectionTitle(
                        AppLocalizations.of(context)
                            .getTranslate("about_app_title_2"),
                      ),
                      _buildListItemWithIcon(
                        AppLocalizations.of(context)
                            .getTranslate("description_about_app_4"),
                      ),
                      _buildListItemWithIcon(
                        AppLocalizations.of(context)
                            .getTranslate("description_about_app_5"),
                      ),
                      _buildListItemWithIcon(
                        AppLocalizations.of(context)
                            .getTranslate("description_about_app_6"),
                      ),
                      const Gap(20),
                      _buildSectionTitle(
                        AppLocalizations.of(context)
                            .getTranslate("about_app_title_3"),
                      ),
                      _buildListItemWithIcon(
                        AppLocalizations.of(context)
                            .getTranslate("description_about_app_7"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: MyBottomNavBar(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Widget _buildListItemWithIcon(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "• ",
            style: TextStyle(fontSize: 20),
          ),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
