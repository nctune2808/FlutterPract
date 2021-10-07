import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoping_list_bloc/auth/auth_repository.dart';

class MessageView extends StatelessWidget {
  QueryDocumentSnapshot message;
  bool isTap = false;
  MessageView({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          _isMe() ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: _isMe()
              ? EdgeInsets.only(top: 5, bottom: 5, left: 150, right: 10)
              : EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 150),
          child: GestureDetector(
            onLongPress: () {
              print(isTap);
            },
            onTap: () {
              isTap = true;
              print(message['time']);
              // setState({
//need test
              // })
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment:
                      _isMe() ? Alignment.bottomLeft : Alignment.bottomRight,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 2.5),
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color:
                            _isMe() ? Colors.lightBlue[100] : Color(0xFFFFEFEE),
                        child: _buildMessage(message),
                      ),
                    ),

                    //-----------------------------
                    if (message['isLiked'])
                      Icon(
                        Icons.favorite,
                        color: Colors.redAccent[100],
                        size: 12.5,
                      ),

                    //-----------------------------
                  ],
                ),
                if (isTap) Icon(Icons.read_more)
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildMessage(QueryDocumentSnapshot message) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 7.5),
      child: Column(
        crossAxisAlignment:
            _isMe() ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Text(
          //   readTime((message['time'] as Timestamp).toDate()),
          //   style: TextStyle(
          //     color: Colors.blueGrey,
          //     fontSize: 12.0,
          //   ),
          // ),
          Text(
            message['text'],
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }

  bool _isMe() {
    return message['sender'] == AuthRepository().getCurrentUser().displayName;
  }
}
