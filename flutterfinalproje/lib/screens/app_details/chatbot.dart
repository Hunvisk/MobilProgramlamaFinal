import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  Future<void> _loadMessages() async {
  String jsonString = await rootBundle.loadString('assets/chatbot/dialog.json');
  Map<String, dynamic> jsonData = json.decode(jsonString); // Json verisini harita olarak işle

  List<dynamic> conversation = jsonData['conversation'];

  setState(() {
    _chatMessages.addAll(
      conversation.map(
        (item) => ChatMessage(
          userMessage: item['user']['message'],
          botMessage: item['chatbot']['message'],
        ),
      ),
    );
  });

  // Yeni bir mesaj geldiğinde otomatik olarak en altına kaydır
  _scrollController.animateTo(
    _scrollController.position.maxScrollExtent,
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeOut,
  );
}


  void _sendMessage(String message) {
    if (message.isEmpty) return; // Metin alanı boşsa göndermeyi durdur

    setState(() {
      _chatMessages.add(ChatMessage(userMessage: message, botMessage: 'Bot yanıtı buraya gelecek'));
    });

    // Yeni bir mesaj geldiğinde otomatik olarak en altına kaydır
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
                  subtitle: Text(message.botMessage),
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
