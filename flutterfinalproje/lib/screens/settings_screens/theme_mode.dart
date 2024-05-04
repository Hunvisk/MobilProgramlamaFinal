import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfinalproje/bloc/client/client_cubit.dart';

import '../../core/localizations.dart';
import '../../widgets/myappbar.dart';

class ThemeModeScreen extends StatefulWidget {
  const ThemeModeScreen({Key? key}) : super(key: key);

  @override
  State<ThemeModeScreen> createState() => _ThemeModeScreenState();
}

class _ThemeModeScreenState extends State<ThemeModeScreen> {
  bool isDarkMode = true; // Varsayılan olarak koyu moda başlayalım

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
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      themeModeItem(
                        context,
                        "light",
                        !isDarkMode, // Ters çevirdik
                        (value) {
                          setState(() {
                            isDarkMode = false; // Açık moda geçiş
                            context.read<ClientCubit>().changeDarkMode(darkMode: false);
                          });
                        },
                        Colors.white,
                      ),
                      themeModeItem(
                        context,
                        "dark",
                        isDarkMode, // Değişiklik yok
                        (value) {
                          setState(() {
                            isDarkMode = true; // Koyu moda geçiş
                            context.read<ClientCubit>().changeDarkMode(darkMode: true);
                          });
                        },
                        Colors.black,
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

  Widget themeModeItem(BuildContext context, String title, bool isChecked, void Function(bool?)? onChanged, Color color) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 100,
          height: 200,
        ),
        const Gap(5),
        Text(
          AppLocalizations.of(context).getTranslate(title),
        ),
        const Gap(5),
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
