import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_list_bloc/auth/auth_repository.dart';
import 'package:shoping_list_bloc/talk/talk_bloc.dart';
import 'package:shoping_list_bloc/talk/talk_repository.dart';
import 'package:shoping_list_bloc/utility/form_submission_status.dart';
import 'package:shoping_list_bloc/utility/function/covert.dart';

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
            // widget.user.name,
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
                  return _buildMessage(messages[index]);
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
                      decoration: InputDecoration(hintText: "Send something?"),
                      controller: _textController,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context
                          .read<TalkBloc>()
                          .add(SentMessageEvent(message: _textController.text));

                      _textController.clear();
                    },
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

  Widget _buildMessage(QueryDocumentSnapshot message) {
    final isMe =
        message['sender'] == AuthRepository().getCurrentUser().displayName;
    final Column msg = Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isMe ? Colors.lightBlue[100] : Color(0xFFFFEFEE),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            margin: isMe // max bubble size per chat
                ? EdgeInsets.only(top: 20, left: 150)
                : EdgeInsets.only(top: 20, right: 150),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // width: MediaQuery.of(context).size.width * 0.75,
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  readTime((message['time'] as Timestamp).toDate()),
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  message['text'],
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          )
        ]);
    if (isMe) {
      return msg;
    }
    return msg;
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
