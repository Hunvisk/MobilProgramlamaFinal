// ignore_for_file: camel_case_types, use_key_in_widget_constructors, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfinalproje/bloc/client/client_cubit.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/localizations.dart';

class Change_LanguageScreen extends StatefulWidget {
  const Change_LanguageScreen({Key? key});

  @override
  State<Change_LanguageScreen> createState() => _Change_LanguageScreenState();
}

class _Change_LanguageScreenState extends State<Change_LanguageScreen> {
  String selectedLanguage = ''; // Seçili dilin tutulacağı değişken
  late SharedPreferences prefs; // SharedPreferences nesnesi

  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage(); // Kayıtlı dil bilgisini yükle
  }

  // Kayıtlı dil bilgisini yükleyen fonksiyon
  _loadSelectedLanguage() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguage = prefs.getString('language') ?? ''; // Kayıtlı dil bilgisini yükle, yoksa boş bir string kullan
    });
  }

  // Seçilen dil bilgisini kaydeden fonksiyon
  _saveSelectedLanguage(String language) async {
    await prefs.setString('language', language); // Seçilen dil bilgisini kaydet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context).getTranslate("change_lang_title"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Divider(),
              LangItems(context, AppLocalizations.of(context).getTranslate("turkish"), "tr", "🇹🇷"),
              const Divider(),
              LangItems(context, AppLocalizations.of(context).getTranslate("english"), "en", "🇬🇧"),
              const Divider(),
              LangItems(context, AppLocalizations.of(context).getTranslate("german"), "de", "🇩🇪"),
              const Divider(),
              LangItems(context, AppLocalizations.of(context).getTranslate("russian"), "ru", "🇷🇺"),
              const Divider(),
              LangItems(context, AppLocalizations.of(context).getTranslate("french"), "fr", "🇷🇺"),
              const Divider(),
              LangItems(context, AppLocalizations.of(context).getTranslate("spanish"), "es", "🇷🇺"),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget LangItems(BuildContext context, String name, String language, String flag) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
        onPressed: selectedLanguage == language ? null : () {
          setState(() {
            selectedLanguage = language; // Seçilen dili güncelle
            _saveSelectedLanguage(language); // Seçilen dil bilgisini kaydet
            context.read<ClientCubit>().changeLanguage(language: language);
          });
        },
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(flag),
                  const Gap(20),
                  Text(name),
                ],
              ),
              Checkbox(
                value: selectedLanguage == language, // Seçili dilin checkbox'ı aktif olsun, diğerleri değil
                onChanged: null, // Değişiklik olmaması için onChanged'i devre dışı bırak
              )
            ],
          ),
        ),
      ),
    );
  }
}