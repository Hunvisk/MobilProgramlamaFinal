
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/localizations.dart';
import '../../widgets/myappbar.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<Map<String, dynamic>> notifications = [
    {
      "title": "",
      "description": "",
      "enabled": true,
    },
    {
      "title": "",
      "description": "",
      "enabled": true,
    },
    {
      "title": "",
      "description": "",
      "enabled": true,
    },
    {
      "title": "",
      "description": "",
      "enabled": true,
    },
    {
      "title": "",
      "description": "",
      "enabled": true,
    },
  ];

  int selectedOption = 0;

  @override
  void initState() {
    super.initState();
    _loadPreferences(); // Önbellekten tercihleri yükle
  }

// Önbellekten tercihleri yükler
  _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      notifications = notifications.map((notification) {
        notification["title"] = AppLocalizations.of(context).getTranslate(
            "notifications_title${notifications.indexOf(notification) + 1}");
        notification["description"] = AppLocalizations.of(context).getTranslate(
            "notifications_description${notifications.indexOf(notification) + 1}");
        bool? enabled = prefs.getBool(notification['title']);
        if (enabled != null) {
          notification['enabled'] = enabled;
        }
        return notification;
      }).toList();
      selectedOption = prefs.getInt('selected_option') ?? 0;
    });
  }

// Tercihleri kaydeder
  _savePreference(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context).getTranslate("notifications"),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: notifications.length + 1,
          itemBuilder: (context, index) {
            if (index == notifications.length) {
              // Tercih seçenekleri listesi
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(10),
                  const Divider(),
                  const Gap(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      AppLocalizations.of(context)
                          .getTranslate("notifications_inform_me"),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      AppLocalizations.of(context)
                          .getTranslate("all_new_messages"),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      AppLocalizations.of(context)
                          .getTranslate("all_new_messages_description"),
                    ),
                    leading: Radio(
                      value: notifications.length,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value as int;
                        });
                        _savePreference('selected_option', value);
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      AppLocalizations.of(context)
                          .getTranslate("mentioned_only"),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      AppLocalizations.of(context)
                          .getTranslate("mentioned_only_description"),
                    ),
                    leading: Radio(
                      value: notifications.length + 1,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value as int;
                        });
                        _savePreference('selected_option', value);
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      AppLocalizations.of(context).getTranslate("nothing"),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      AppLocalizations.of(context)
                          .getTranslate("nothing_description"),
                    ),
                    leading: Radio(
                      value: notifications.length + 2,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value as int;
                        });
                        _savePreference('selected_option', value);
                      },
                    ),
                  ),
                ],
              );
            }
            // Bildirim kartı
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(
                  notifications[index]['title']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(notifications[index]['description']!),
                leading: const Icon(Icons.notifications),
                trailing: Switch(
                  value: notifications[index]['enabled'],
                  onChanged: (bool value) {
                    setState(() {
                      notifications[index]['enabled'] = value;
                    });
                    _savePreference(notifications[index]['title']!, value);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
