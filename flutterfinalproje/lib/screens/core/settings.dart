import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/localizations.dart';
import '../../widgets/myappbar.dart';
import '../../widgets/mybottomnavbar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String camResult = "";
  String locationResult = "";

  void controlPermission() async {
    var cameraStatus = await Permission.camera.status;
    var locationStatus = await Permission.location.status;

    setState(() {
      camResult = getStatusMessage(cameraStatus);
      locationResult = getStatusMessage(locationStatus);
    });
  }

  String getStatusMessage(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.granted:
        return "Yetki Alınmış";
      case PermissionStatus.denied:
        return "Yetki Verme Reddedildi";
      case PermissionStatus.restricted:
        return "Kısıtlanmış Yetki";
      case PermissionStatus.limited:
        return "Kullanıcı Tarafından Kısıtlanmış Yetki";
      case PermissionStatus.permanentlyDenied:
        return "Sonsuza Kadar Reddedilmiş Yetki";
      case PermissionStatus.provisional:
        return "Provisional";
      default:
        return "Bilinmeyen Durum";
    }
  }

  @override
  void initState() {
    super.initState();
    controlPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context).getTranslate("settings"),
      ),
      body: SizedBox.expand(
        child: ListView(
          children: [
            ExpansionTile(
              title: const Text("Camera permission"),
              children: [
                Text(camResult),
                const Gap(20),
                ElevatedButton(
                  onPressed: () async {
                    final status = await Permission.camera.request();
                    setState(() {
                      camResult = getStatusMessage(status);
                    });
                  },
                  child: const Text("Yetki İste"),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text("Location permission"),
              children: [
                Text(locationResult),
                const Gap(20),
                ElevatedButton(
                  onPressed: () async {
                    final status = await Permission.location.request();
                    setState(() {
                      locationResult = getStatusMessage(status);
                    });
                  },
                  child: const Text("Yetki İste"),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
