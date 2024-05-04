import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfinalproje/bloc/client/client_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/localizations.dart';
import '../../widgets/myappbar.dart';

class ThemeModeScreen extends StatefulWidget {
  const ThemeModeScreen({Key? key}) : super(key: key);

  @override
  State<ThemeModeScreen> createState() => _ThemeModeScreenState();
}

class _ThemeModeScreenState extends State<ThemeModeScreen> {
  late bool isDarkMode; // Varsayılan olarak koyu moda başlayalım
  late SharedPreferences prefs; // SharedPreferences nesnesi

  @override
  void initState() {
    super.initState();
    _loadSelectedMode(); // Kayıtlı dil bilgisini yükle
  }

  // Kayıtlı dil bilgisini yükleyen fonksiyon
  _loadSelectedMode() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('darkMode') ?? true; // Kayıtlı dil bilgisini yükle, yoksa false kullan
    });
  }

  // Seçilen dil bilgisini kaydeden fonksiyon
  _saveSelectedMode(bool darkMode) async {
    await prefs.setBool('darkMode', darkMode); // Seçilen dil bilgisini kaydet
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context).getTranslate("screen"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 10.0),
              child: Text(
                AppLocalizations.of(context).getTranslate("appearance"),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      themeModeItem(
                        context,
                        "light",
                        !isDarkMode, // Ters çevirdik
                        () {
                          setState(() {
                            isDarkMode = false;
                            _saveSelectedMode(false);
                            context.read<ClientCubit>().changeDarkMode(darkMode: false);
                          });
                        },
                        "assets/images/thememodescreen/light_mode_example.jpg",
                      ),
                      themeModeItem(
                        context,
                        "dark",
                        isDarkMode, // Değişiklik yok
                        () {
                          setState(() {
                            isDarkMode = true; // Koyu moda geçiş
                            _saveSelectedMode(true);
                            context.read<ClientCubit>().changeDarkMode(darkMode: true);
                          });
                        },
                        "assets/images/thememodescreen/dark_mode_example.jpg",
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget themeModeItem(BuildContext context, String title, bool isChecked, void Function()? onChanged, String image) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
            height: 250,
            width: 125,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        const Gap(5),
        Text(
          AppLocalizations.of(context).getTranslate(title),
        ),
        const Gap(5),
        Checkbox(
          value: isChecked,
          onChanged: onChanged != null ? (bool? value) => onChanged() : null,
        ),
      ],
    );
  }
}
