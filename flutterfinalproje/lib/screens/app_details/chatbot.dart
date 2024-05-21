import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // Ekledik

class ChatMessage {
  final String userMessage;
  final String botMessage;

  ChatMessage({
    required this.userMessage,
    required this.botMessage,
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

  Map<String, dynamic> _conversationData = {};

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    String jsonString = await rootBundle.loadString('assets/chatbot/dialog.json');
    setState(() {
      _conversationData = json.decode(jsonString);
    });

    _scrollToBottom();
  }

  void _sendMessage(String message) {
    if (message.isEmpty) return;

    setState(() {
      String botMessage = _getBotReply(message);
      _chatMessages.add(ChatMessage(userMessage: message, botMessage: botMessage));
    });

    _scrollToBottom();
  }

  String _getBotReply(String message) {
    List<dynamic> conversation = _conversationData['conversation'];
    for (var item in conversation) {
      if (item['user']['message'] == message) {
        return item['chatbot']['message'];
      }
    }
    return 'Üzgünüm, anlayamadım. Şifremi nasıl değiştirebilirim ?, Şifremi nasıl sıfırlarım ?, Nasıl abone olabilirim ?, Abone olduktan sonra hangi özellikleri kullanabilirim ? Gibi Şeyler Yazarak Size Daha Kolay Geri Dönüş Sağlayabilirim. Ammmmaaaannnn Dikkat Baş Harfleri Büyük Yazmayı Unutma!!!';
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('ChatBot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _chatMessages.length,
              itemBuilder: (BuildContext context, int index) {
                final message = _chatMessages[index];

                return ListTile(
                  title: Text(message.userMessage),
                  subtitle: AnimatedTextKit( // Ekledik
                    animatedTexts: [
                      
                      TyperAnimatedText(

                        message.botMessage,
                        textStyle:   TextStyle(color:Theme.of(context).colorScheme.primary),
                        speed: const Duration(milliseconds: 50),

                      ),
                    ],
                    repeatForever:false,
                    isRepeatingAnimation: false,
                  ),
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
                    padding: const EdgeInsets.symmetric(vertical: 35.0),
                    child: TextField(
                      controller: _chatController,
                      decoration: const InputDecoration(
                        hintText: 'Mesajınızı buraya yazın...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        contentPadding: EdgeInsets.only(
                          top: 10.0,
                          bottom: 10.0,
                          left: 10.0,
                          right: 5.0,
                        ),
                      ),
                      onSubmitted: _sendMessage,
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

