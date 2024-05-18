
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/client/client_cubit.dart';
import '../../core/localizations.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({Key? key}) : super(key: key);

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
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
              langItems(context, AppLocalizations.of(context).getTranslate("turkish"), "tr", "🇹🇷"),
              const Divider(),
              langItems(context, AppLocalizations.of(context).getTranslate("english"), "en", "🇬🇧"),
              const Divider(),
              langItems(context, AppLocalizations.of(context).getTranslate("german"), "de", "🇩🇪"),
              const Divider(),
              langItems(context, AppLocalizations.of(context).getTranslate("russian"), "ru", "🇷🇺"),
              const Divider(),
              langItems(context, AppLocalizations.of(context).getTranslate("french"), "fr", "🇫🇷"),
              const Divider(),
              langItems(context, AppLocalizations.of(context).getTranslate("spanish"), "es", "🇪🇸"),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget langItems(BuildContext context, String name, String language, String flag) {
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
        child: SizedBox(
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