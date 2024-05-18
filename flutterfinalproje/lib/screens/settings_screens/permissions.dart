import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/localizations.dart';
import '../../widgets/myappbar.dart';

class PermissionsScreen extends StatefulWidget {
  const PermissionsScreen({super.key});

  @override
  State<PermissionsScreen> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  String locationResult = "";
  String notificationsResult = "";
  String mediaLibraryResult = "";
  String photosResult = "";

  void controlPermission() async {
    var locationStatus = await Permission.location.status;
    var notificationsStatus = await Permission.notification.status;
    var mediaLibraryStatus = await Permission.mediaLibrary.status;
    var photosStatus = await Permission.photos.status;

    setState(() {
      
      locationResult = getStatusMessage(locationStatus);
      notificationsResult = getStatusMessage(notificationsStatus);
      mediaLibraryResult = getStatusMessage(mediaLibraryStatus);
      photosResult = getStatusMessage(photosStatus);
    });
  }

  String getStatusMessage(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.granted:
        return AppLocalizations.of(context)
                                .getTranslate("authorized");
      case PermissionStatus.denied:
        return AppLocalizations.of(context)
                                .getTranslate("authorization_denied");
      case PermissionStatus.restricted:
        return AppLocalizations.of(context)
                                .getTranslate("restricted_authority");
      case PermissionStatus.limited:
        return AppLocalizations.of(context)
                                .getTranslate("user_restricted_authorization");
      case PermissionStatus.permanentlyDenied:
        return AppLocalizations.of(context)
                                .getTranslate("forever_denied_authority");
      case PermissionStatus.provisional:
        return AppLocalizations.of(context)
                                .getTranslate("provisional");
      default:
        return AppLocalizations.of(context)
                                .getTranslate("unknown_status");
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
        title: AppLocalizations.of(context).getTranslate("permissions"),
      ),
      body: SafeArea(
        child: SizedBox.expand(
        child: ListView(
          children: [
            
            ExpansionTile(
              title:  Text(AppLocalizations.of(context).getTranslate("location_permission")),
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
                  child:  Text(AppLocalizations.of(context).getTranslate("request_authorization")),
                ),
              ],
            ),
            ExpansionTile(
              title:  Text(AppLocalizations.of(context).getTranslate("media_permission")),
              children: [
                Text(mediaLibraryResult),
                const Gap(20),
                ElevatedButton(
                  onPressed: () async {
                    final status = await Permission.mediaLibrary.request();
                    setState(() {
                      mediaLibraryResult = getStatusMessage(status);
                    });
                  },
                  child:  Text(AppLocalizations.of(context).getTranslate("request_authorization")),
                ),
              ],
            ),
            ExpansionTile(
              title:  Text(AppLocalizations.of(context).getTranslate("photos_permission")),
              children: [
                Text(photosResult),
                const Gap(20),
                ElevatedButton(
                  onPressed: () async {
                    final status = await Permission.photos.request();
                    setState(() {
                      photosResult = getStatusMessage(status);
                    });
                  },
                  child:  Text(AppLocalizations.of(context).getTranslate("request_authorization")),
                ),
              ],
            ),
            ExpansionTile(
              title:  Text(AppLocalizations.of(context).getTranslate("notifications_permission")),
              children: [
                Text(notificationsResult),
                const Gap(20),
                ElevatedButton(
                  onPressed: () async {
                    final status = await Permission.notification.request();
                    setState(() {
                      notificationsResult = getStatusMessage(status);
                    });
                  },
                  child:  Text(AppLocalizations.of(context).getTranslate("request_authorization")),
                ),
              ],
            ),
          ],
        ),
      ),

      ),
    );
  }
}