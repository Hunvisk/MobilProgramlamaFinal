import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/addcard_card.dart';

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
  Future<List<AddCardPayment>> loadCards() async {
    const storage =  FlutterSecureStorage();

    final cards = await storage.read(key: "AddCardPayment");

    if(cards != null) {
    // ben kaydetmisim
    final temp = jsonDecode(cards) ;
    List<AddCardPayment> cardList = [];
    for(var i = 0; i < temp.length; i++) {
      cardList.add(AddCardPayment.fromJson(jsonDecode(temp[i])));
    }

    return cardList;
    }
    else {
      return [];
    }
  }

  saveCards(List<AddCardPayment> cards) async {
    const storage =  FlutterSecureStorage();

    List<String> cardsString = [];

    for (var i = 0; i < cards.length; i++) {
      cardsString.add(jsonEncode(cards[i].toJson()));
    }
    

   await storage.write(key: "AddCardPayment", value: jsonEncode(cardsString));
  }


  clearStorage() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.clear();
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
  
 




