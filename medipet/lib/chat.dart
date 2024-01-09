import 'package:flutter/material.dart';

import 'app_bar.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController _messageController = TextEditingController();
  List<ChatMessage> _chatMessages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'lib/assets/logo.png',
              height: kToolbarHeight - 8,
            ),
            Align(
              alignment: Alignment.center,
              child: const Text(
                'PAWPAL',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        context: context,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: [
              // Chat Interface
              Expanded(
                child: ListView.builder(
                  itemCount: _chatMessages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _chatMessages[index],
                    );
                  },
                ),
              ),

              // Text Input and Send Button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFFFF8F00)),
                        fixedSize: MaterialStateProperty.all<Size>(
                          Size.fromHeight(50.0),
                        ),
                      ),
                      onPressed: () {
                        _sendMessage();
                      },
                      child: Text('SEND'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendMessage() {
    String userMessage = _messageController.text;
    _messageController.clear();

    setState(() {
      // Add user message
      _chatMessages.add(ChatMessage(
        message: userMessage,
        isUser: true,
      ));

      // Simulate a reply from PawPal
      _chatMessages.add(ChatMessage(
        message:
            'Hellow fellow furiends. This is just a prototype and not a complete system. '
            'Thank you for using it, but I cant help you with anything',
        isUser: false,
      ));
    });
  }
}

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isUser;

  const ChatMessage({
    Key? key,
    required this.message,
    required this.isUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isUser ? Color(0xFFFF8F00) : Color.fromARGB(255, 214, 96, 0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
