import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo/auth/session/session_bloc.dart';
import 'package:tolo/model/message.dart';
import 'package:tolo/model/user.dart';
import 'package:tolo/src/chat/message/message_bloc.dart';
import 'package:tolo/src/chat/message/message_view.dart';
import 'package:tolo/src/chat/chat_bloc.dart';
import 'package:tolo/src/chat/chat_repository.dart';
import 'package:tolo/src/home/loading_view.dart';
import 'package:tolo/utility/state/status.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final _textController = TextEditingController();
  bool isMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: BlocBuilder<SessionBloc, SessionState>(builder: (context, state) {
        return BlocBuilder<ChatBloc, ChatState>(
          builder: (context, cState) {
            // auth-ed and fetched done
            if (cState.status is StatusSucess &&
                state.status is StatusAuthenticated) {
              return _sceneBuilder();
            } else {
              return LoadingView();
            }
          },
        );
      }),
    );
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
    var who;
    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, state) {
        if (state.user != null) who = (state.user!.username);
        return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: ChatRepository().getSnapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: RefreshProgressIndicator(),
              );
            }
            List<Message> messages = (snapshot.data!.docs)
                .map((message) =>
                    Message.fromMap(message.data()).copyWith(id: message.id))
                .toList();

            print(messages);

            // snapshot.data!.docs.forEach((element) {
            //   print(element);
            // });
            return Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  isMe = (who == messages[index].sender);
                  return MessageView(message: messages[index], isMe: isMe);
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _composeForm() {
    return BlocBuilder<SessionBloc, SessionState>(
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
    );
  }

  void _onSubmission({required User user}) {
    BlocProvider.of<MessageBloc>(context).add(SentMessageEvent(
        message: Message(
            text: _textController.text,
            sender: user.username,
            isLiked: false,
            seen: false,
            time: Timestamp.fromDate(DateTime.now()))));
    _textController.clear();
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
