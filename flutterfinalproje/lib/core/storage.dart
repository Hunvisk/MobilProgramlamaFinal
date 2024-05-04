import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Future<bool> isFirstLaunch() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    final runned = storage.getBool("runned");

    if (runned == null) {
      return true;
    } else {
      return false;
    }
  }

  firstLaunched() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setBool("runned", true);
  }

  setConfig({String? language, bool? darkMode}) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    if (language != null) {
      await storage.setString("language", language);
    }

    if (darkMode != null) {
      await storage.setBool("darkMode", darkMode);
    }
  }

  getConfig() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    return {
      "language": storage.getString("language"),
      "darkMode": storage.getBool("darkMode"),
    };
  }

  clearStorage() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.clear();
  }

  chatStorageClear() async {
    final SharedPreferences messages = await SharedPreferences.getInstance();
    await messages.clear();
  }
  
}


class ChatStorage {
  static const _key = 'chat_messages';

  static Future<List<String>> getMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final messages = prefs.getStringList(_key);
    return messages ?? [];
  }

  static Future<void> saveMessage(String message) async {
    final prefs = await SharedPreferences.getInstance();
    final messages = await getMessages();
    messages.add(message);
    await prefs.setStringList(_key, messages);
  }

   
}
  
 




