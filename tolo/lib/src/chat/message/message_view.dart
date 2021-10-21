import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo/auth/session/session_bloc.dart';
import 'package:tolo/model/message.dart';
import 'package:tolo/src/chat/message/message_bloc.dart';
import 'package:tolo/utility/state/status.dart';

class MessageView extends StatefulWidget {
  Message message;
  MessageView({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  _MessageViewState createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  bool isTap = false;
  bool isMy = false;
  String username = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MessageBloc()..add(LoadMessageEvent(message: widget.message)),
      child: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) {
          return BlocBuilder<MessageBloc, MessageState>(
            builder: (context, mState) {
              if (mState.status is StatusSucess) {
                if (state.user != null) {
                  isMy = (state.user!.displayName == widget.message.sender);
                  return _sceneBuilder();
                } else {
                  return Text("Unauth");
                }
              } else {
                return Center(child: LinearProgressIndicator(minHeight: 0.5));
              }
            },
          );
        },
      ),
    );
  }

  Widget _sceneBuilder() {
    return Column(
      crossAxisAlignment:
          isMy ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: isMy
              ? EdgeInsets.only(top: 5, bottom: 5, left: 150, right: 10)
              : EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 150),
          child: GestureDetector(
              onLongPress: () {
                print(isTap);
              },
              onTap: () {
                isTap = true;
                print(widget.message.time);
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
          alignment: isMy ? Alignment.bottomLeft : Alignment.bottomRight,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 2.5),
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: isMy ? Colors.lightBlue[100] : Color(0xFFFFEFEE),
                child: _messageStyle(),
              ),
            ),

            //-----------------------------
            if (widget.message.isLiked!)
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
            isMy ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Text(
          //   readTime((message['time'] as Timestamp).toDate()),
          //   style: TextStyle(
          //     color: Colors.blueGrey,
          //     fontSize: 12.0,
          //   ),
          // ),
          Text(
            widget.message.text,
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
