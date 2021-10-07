import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_list_bloc/auth/auth_repository.dart';
import 'package:shoping_list_bloc/model/message.dart';
import 'package:shoping_list_bloc/src/talk/message/message_view.dart';
import 'package:shoping_list_bloc/src/talk/talk_bloc.dart';
import 'package:shoping_list_bloc/src/talk/talk_repository.dart';

class TalkView extends StatefulWidget {
  @override
  _TalkViewState createState() => _TalkViewState();
}

class _TalkViewState extends State<TalkView> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Message",
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
        ),
        body: _boxChat());
  }

  Widget _boxChat() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: TalkRepository().getSnapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final messages = snapshot.data!.docs;
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
        ),
        _composeForm()
      ],
    );
  }

  Widget _composeForm() {
    return BlocListener<TalkBloc, TalkState>(
      listener: (context, state) {
        print(state.formStatus);
      },
      child: BlocBuilder<TalkBloc, TalkState>(
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
                      decoration: InputDecoration(hintText: "Send something?"),
                      controller: _textController,
                      onEditingComplete: () => _onSubmission(),
                    ),
                  ),
                  IconButton(
                    onPressed: () => _onSubmission(),
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

  void _onSubmission() {
    context
        .read<TalkBloc>()
        .add(SentMessageEvent(message: Message(text: _textController.text)));
    _textController.clear();
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
