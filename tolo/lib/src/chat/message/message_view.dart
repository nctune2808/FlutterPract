import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo/auth/auth_repository.dart';
import 'package:tolo/auth/session/session_bloc.dart';

class MessageView extends StatefulWidget {
  QueryDocumentSnapshot message;
  MessageView({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  _MessageViewState createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  bool isTap = false;
  String uid = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SessionBloc()..add(AuthenSessionEvent()),
      child: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) {
          if (state.user != null) {
            // do graphql user stuff
            // not finished !!!
            print(state.user!.uid);
            return _sceneBuilder();
          } else {
            return Text("Not Authenticate");
          }
        },
      ),
    );
  }

  Widget _sceneBuilder() {
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
                print(widget.message['time']);
              },
              child: _messageBuilder()),
        )
      ],
    );
  }

  Widget _messageBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: _isMe() ? Alignment.bottomLeft : Alignment.bottomRight,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 2.5),
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: _isMe() ? Colors.lightBlue[100] : Color(0xFFFFEFEE),
                child: _messageStyle(),
              ),
            ),

            //-----------------------------
            if (widget.message['isLiked'])
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
    );
  }

  Widget _messageStyle() {
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
            widget.message['text'],
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
    return false;
    // return message['sender'] == AuthRepository().getCurrentUser().displayName;
  }
}
