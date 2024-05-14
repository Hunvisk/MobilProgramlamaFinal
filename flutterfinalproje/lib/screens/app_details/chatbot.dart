// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // animated_text_kit eklenmeli
import 'package:intl/intl.dart';

import '../../core/localizations.dart';
import '../../core/storage.dart';

class ChatMessage {
  final String text;
  final DateTime time; // Eklenen alan: Mesajın gönderildiği zaman

  ChatMessage({
    required this.text,
    required this.time,
  });
}

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessage> _chatMessages = [];

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _loadMessages() async {
    final messages = await ChatStorage.getMessages();
    setState(() {
      _chatMessages.addAll(messages.map((text) => ChatMessage(text: text, time: DateTime.now())));
    });
  }

  

  void _sendMessage(String message) async {
    if (message.isEmpty) return; // Metin alanı boşsa göndermeyi durdur

    DateTime now = DateTime.now(); // Mesajın gönderildiği anın zamanını al

    setState(() {
      _chatMessages.add(ChatMessage(text: "Kullanıcı: $message", time: now, ));
    });

    await ChatStorage.saveMessage("Kullanıcı: $message");

    // Burada chatbot'un yanıtını üretebilirsiniz.
    String botReply = _generateBotReply(message);

    setState(() {
      _chatMessages.add(ChatMessage(text: "GezginBot: $botReply", time: now));
    });

    await ChatStorage.saveMessage("GezginBot: $botReply");

    // Yeni bir mesaj geldiğinde otomatik olarak en altına kaydır
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  String _generateBotReply(String message) {
    // Basit bir bot yanıtı üretme
    if (message.toLowerCase().contains('selam')) {
      return 'Merhaba!';
    } else if (message.toLowerCase().contains('nasılsın')) {
      return 'Ben bir botum, bu yüzden duygularım yok, ama teşekkür ederim! Siz nasılsınız?';
    } else {
      return 'Üzgünüm, anlayamadım. Başka bir şey deneyebilir misiniz?';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).getTranslate("chatbot")),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController, // Scroll kontrolcüsü eklendi
              itemCount: _chatMessages.length,
              itemBuilder: (BuildContext context, int index) {
                final message = _chatMessages[index];
                final isUserMessage = index % 2 == 0;

                return Row(
                  mainAxisAlignment: isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                      padding: const EdgeInsets.all(8.0),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7, // Maksimum genişlik belirleniyor
                      ),
                      decoration: BoxDecoration(
                        color: isUserMessage ? Colors.blue[100] : Theme.of(context).colorScheme.tertiaryContainer,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Animasyonlu metin gösterimi
                          isUserMessage
                              ? Text(
                                  message.text,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                )
                              : SizedBox(
                                  width: 250.0,
                                  child: DefaultTextStyle(
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Agne',
                                      color: Colors.white,
                                    ),
                                    child: AnimatedTextKit(
                                      // repeatForever: false,
                                      totalRepeatCount: 1,
                                      animatedTexts: [
                                        TypewriterAnimatedText(
                                          message.text,

                                          speed: const Duration(milliseconds: 35),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          const SizedBox(height: 4),
                          Text(
                            DateFormat.Hm().format(message.time),
                            style: TextStyle(
                              color: isUserMessage ? Colors.black54 : Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:35.0),
                    child: TextField(
                      controller: _chatController,
                      decoration: const InputDecoration(
                        hintText: "Mesajınızı buraya yazın...",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        contentPadding: EdgeInsets.only(
                          top: 10.0,
                          bottom: 10.0,
                          left: 10.0,
                          right: 5.0,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    _sendMessage(_chatController.text);
                    _chatController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
