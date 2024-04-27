import 'package:flutter/material.dart';

class Message {
  final String sender;
  final String content;
  final DateTime timestamp;

  Message({
    required this.sender,
    required this.content,
    required this.timestamp,
  });
}

class GroupChatPage extends StatefulWidget {
  static const routeName = '/group-chat';

  @override
  _GroupChatPageState createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Message> _chatHistory = [
    Message(
      sender: 'Alice',
      content: 'Hey, how is everyone?',
      timestamp: DateTime.now().subtract(Duration(minutes: 5)),
    ),
    Message(
      sender: 'Bob',
      content: 'I\'m doing great, thanks for asking!',
      timestamp: DateTime.now().subtract(Duration(minutes: 4)),
    ),
    Message(
      sender: 'Charlie',
      content: 'Anyone up for a game later?',
      timestamp: DateTime.now().subtract(Duration(minutes: 3)),
    ),
    Message(
      sender: 'Alice',
      content: 'Sure, I\'m in!',
      timestamp: DateTime.now().subtract(Duration(minutes: 2)),
    ),
    Message(
      sender: 'David',
      content: 'Count me in too!',
      timestamp: DateTime.now().subtract(Duration(minutes: 1)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Group Chat",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chatHistory.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                final message = _chatHistory[index];
                return ListTile(
                  title: Text(message.sender),
                  subtitle: Text(message.content),
                  trailing: Text(
                    '${message.timestamp.hour}:${message.timestamp.minute}',
                  ),
                );
              },
            ),
          ),
          _buildChatInput(),
        ],
      ),
    );
  }

  Widget _buildChatInput() {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.grey[200],
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _chatController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }

  Future<void> _sendMessage() async {
    final messageText = _chatController.text.trim();
    if (messageText.isNotEmpty) {
      // Simulate sending message to server
      final message = Message(
        sender: 'You', // For simplicity, assume sender is always 'You'
        content: messageText,
        timestamp: DateTime.now(),
      );
      setState(() {
        _chatHistory.add(message);
        _chatController.clear();
      });
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);

      // TODO: Send message to server and handle real-time updates
    }
  }
}
