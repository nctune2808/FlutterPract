import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo/model/message.dart';
import 'package:tolo/src/chat/message/message_bloc.dart';
import 'package:tolo/utility/function/covert.dart';
import 'package:tolo/utility/state/status.dart';

class MessageView extends StatefulWidget {
  Message message;
  bool isMe;
  MessageView({
    Key? key,
    required this.message,
    required this.isMe,
  }) : super(key: key);

  @override
  _MessageViewState createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  bool isLongPress = false;
  bool isDoubleTap = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // because stream message depend on fetched data to pass
      create: (context) =>
          MessageBloc()..add(LoadMessageEvent(message: widget.message)),
      child: BlocBuilder<MessageBloc, MessageState>(
        builder: (context, state) {
          // print("--Message Test: ${state.message}");
          if (state.status is StatusSucess) {
            return _sceneBuilder();
          } else {
            return Center(child: LinearProgressIndicator(minHeight: 0.2));
          }
        },
      ),
    );
  }

  Widget _sceneBuilder() {
    return Column(
      crossAxisAlignment:
          widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: widget.isMe
              ? EdgeInsets.only(top: 5, bottom: 5, left: 150, right: 10)
              : EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 150),
          child: GestureDetector(
            onLongPress: () {
              setState(() => isLongPress = !isLongPress);
            },
            onDoubleTap: () {
              setState(() => isDoubleTap = !isDoubleTap);
              context.read<MessageBloc>().add(UpdateMessageEvent(
                  message: widget.message.copyWith(isLiked: isDoubleTap)));
            },
            child: _messageBuilder(),
          ),
        )
      ],
    );
  }

  Widget _messageBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (isLongPress) Text((readTime(widget.message.time!.toDate()))),
        Stack(
          alignment: widget.isMe ? Alignment.bottomLeft : Alignment.bottomRight,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 2.5),
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: widget.isMe ? Colors.lightBlue[100] : Color(0xFFFFEFEE),
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
      ],
    );
  }

  Widget _messageStyle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 7.5),
      child: Column(
        crossAxisAlignment:
            widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
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
}
