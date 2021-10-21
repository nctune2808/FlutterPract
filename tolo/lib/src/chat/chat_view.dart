import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo/auth/session/session_bloc.dart';
import 'package:tolo/model/message.dart';
import 'package:tolo/src/chat/message/message_bloc.dart';
import 'package:tolo/src/chat/message/message_view.dart';
import 'package:tolo/src/chat/chat_bloc.dart';
import 'package:tolo/src/chat/chat_repository.dart';
import 'package:tolo/utility/state/status.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            if (state.status is StatusSucess) {
              return _sceneBuilder();
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        "Chatting",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.more_horiz),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        )
      ],
    );
  }

  Widget _sceneBuilder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_boxChat(), _composeForm()],
    );
  }

  Widget _boxChat() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: ChatRepository().getSnapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Message> messages = (snapshot.data!.docs)
            .map((message) => Message.fromMap(message.data()))
            .toList();

        // snapshot.data!.docs.forEach((element) {
        //   print(element);
        // });
        return Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              return MessageView(message: messages[index]);
            },
          ),
        );
      },
    );
  }

  Widget _composeForm() {
    return BlocProvider(
      create: (context) => SessionBloc()..add(AuthenSessionEvent()),
      child: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      autocorrect: false,
                      autofocus: true,
                      decoration: InputDecoration(hintText: "Send something?"),
                      controller: _textController,
                      onEditingComplete: () => _onSubmission(user: state.user!),
                    ),
                  ),
                  IconButton(
                    onPressed: () => _onSubmission(user: state.user!),
                    icon: Icon(Icons.send),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onSubmission({required User user}) {
    context.read<MessageBloc>().add(SentMessageEvent(
            message: Message(
          text: _textController.text,
          sender: user.displayName,
        )));
    _textController.clear();
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
