import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatBotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatBotScreen(),
    );
  }
}

class ChatBotScreen extends StatefulWidget {
  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  TextEditingController messageController = TextEditingController();
  List<ChatMessage> chatMessages = [];

  @override
  void initState() {
    super.initState();
    _getInitialBotResponse();
  }

  void _addChatMessage(String text, {bool isBotResponse = false}) {
    ChatMessage message = ChatMessage(text: text, isBotResponse: isBotResponse);
    setState(() {
      chatMessages.add(message);
    });
  }

  void _getInitialBotResponse() {
    _addChatMessage('Hello, I\'m AIS Bot!', isBotResponse: true);
    _addChatMessage('How can I assist you?', isBotResponse: true);
  }

  Future<List<dynamic>> _fetchCareerData() async {
    final response = await http
        .get(Uri.parse('https://api-ferminacare.tech/api/v1/careers'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load career data');
    }
  }

  bool _isAllowedTopic(String question, List<dynamic> careerData) {
    if (careerData.isEmpty) return false;

    for (var career in careerData) {
      String jobTitle = career['title_job'].toString().toLowerCase();
      String jobCompany = career['company'].toString().toLowerCase();

      if (jobTitle.contains(question.toLowerCase()) ||
          jobCompany.contains(question.toLowerCase())) {
        return true;
      }
    }

    return false;
  }

  void _getChatBotResponse(String query) async {
    _addChatMessage('Typing...', isBotResponse: true);
    try {
      if (_isMentalHealthQuestion(query)) {
        _addChatMessage(
          'Mental health is an important aspect of our well-being. If you feel stressed or anxious, try doing activities you enjoy or talk to someone close to you.',
          isBotResponse: true,
        );
        _addChatMessage(
          'If your mental health issues are serious, it\'s highly recommended to seek help from a mental health professional.',
          isBotResponse: true,
        );
      } else if (_isCareerRecommendation(query)) {
        final careerData = await _fetchCareerData();

        if (_isAllowedTopic(query, careerData)) {
          List<String> matchedJobs = [];

          for (var job in careerData) {
            String jobTitle = job['title_job'].toString().toLowerCase();
            String jobCompany = job['company'].toString().toLowerCase();

            if (jobTitle.contains(query.toLowerCase()) ||
                jobCompany.contains(query.toLowerCase())) {
              matchedJobs.add('${job['title_job']} at ${job['company']}');
            }
          }

          if (matchedJobs.isNotEmpty) {
            _addChatMessage(
              'Here are some jobs related to your query:',
              isBotResponse: true,
            );
            for (var job in matchedJobs) {
              _addChatMessage(job, isBotResponse: true);
            }
          } else {
            _addChatMessage(
              'There are no jobs related to your query.',
              isBotResponse: true,
            );
          }
        } else {
          _addChatMessage(
            'The query does not match our career data.',
            isBotResponse: true,
          );
        }
      } else if (_isComplaint(query)) {
        _addChatMessage(
          'We apologize for the inconvenience. Please provide further details about your complaint so that we can assist in resolving it.',
          isBotResponse: true,
        );
      } else {
        _addChatMessage('I\'m not sure how to answer this question.',
            isBotResponse: true);
        _addChatMessage('Is there any other question I can help with?',
            isBotResponse: true);
      }
    } catch (error) {
      _addChatMessage('Error: $error', isBotResponse: true);
    }
  }

  bool _isCareerRecommendation(String query) {
    return query.toLowerCase().contains('career recommendation') ||
        query.toLowerCase().contains('suitable career');
  }

  bool _isMentalHealthQuestion(String query) {
    return query.toLowerCase().contains('mental health');
  }

  bool _isComplaint(String query) {
    return query.toLowerCase().contains('complaint');
  }

  void _handleSubmittedMessage(String text) {
    if (text.isNotEmpty) {
      _addChatMessage('$text', isBotResponse: false);
      _getChatBotResponse(text);
      messageController.clear();
    }
  }

  void _clearChat() {
    setState(() {
      chatMessages.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFDCEDF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Chat Bot',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                final message = chatMessages[index];
                final isBotMessage = message.isBotResponse;

                return ChatBubble(
                  message: message,
                  isBot: isBotMessage,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: messageController,
                    onSubmitted: _handleSubmittedMessage,
                    decoration: InputDecoration(
                      labelText: 'Send a message...',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.mic),
                        onPressed: () {
                          // Voice note logic
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Spacer
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF4518D),
                  ),
                  child: IconButton(
                    icon: Transform.rotate(
                      angle: 320 * 3.1415926535 / 180, // 30 degrees
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      _handleSubmittedMessage(messageController.text);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isBotResponse;

  ChatMessage({required this.text, this.isBotResponse = false});
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isBot;

  ChatBubble({required this.message, required this.isBot});

  @override
  Widget build(BuildContext context) {
    Color botTextColor = Colors.white;

    return Row(
      mainAxisAlignment:
          isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: <Widget>[
        isBot ? _buildProfileAvatar() : SizedBox(), // Bot avatar
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Column(
              crossAxisAlignment:
                  isBot ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    isBot ? 'Chat Bot' : 'You',
                    style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isBot ? Color(0xFFF4518D) : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      fontSize: 18,
                      color: isBot ? botTextColor : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        !isBot ? _buildProfileAvatar() : SizedBox(), // User avatar
      ],
    );
  }

  Widget _buildProfileAvatar() {
    return CircleAvatar(
      radius: 16,
      backgroundImage: isBot
          ? AssetImage('assets/bot_profile.jpg') // Path to bot's profile image
          : AssetImage(
              'assets/user_profile.jpg'), // Path to user's profile image
    );
  }
}
