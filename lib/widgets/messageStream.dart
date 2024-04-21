import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'messageBubble.dart';

class MessageStream extends StatelessWidget {
  MessageStream({super.key, required this.user});
  final _fireStore = FirebaseFirestore.instance;
  final User? user;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fireStore
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data?.docs;
          List<MessageBubble> messagesBubbles = [];
          for (var message in messages!) {
            var messageDatas = message.data() as Map;
            final messageText = messageDatas['text'];
            final messageSender = messageDatas['sender'];
            final currentUser = user?.email;
            print(currentUser);
            final messageBubble = MessageBubble(
              sender: messageSender,
              message: messageText,
              isMe: currentUser == messageSender,
            );
            messagesBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              children: messagesBubbles,
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
      },
    );
  }
}
