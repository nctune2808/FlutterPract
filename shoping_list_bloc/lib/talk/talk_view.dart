import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_list_bloc/auth/auth_repository.dart';
import 'package:shoping_list_bloc/model/message.dart';
import 'package:shoping_list_bloc/talk/talk_bloc.dart';
import 'package:shoping_list_bloc/talk/talk_repository.dart';
import 'package:shoping_list_bloc/utility/form_submission_status.dart';

class TalkView extends StatelessWidget {
  // _buildMessage(Message message, bool isMe) {
  //   final Container msg = Container(
  //     decoration: BoxDecoration(
  //       color: isMe ? Colors.lightBlue[100] : Color(0xFFFFEFEE),
  //       borderRadius: BorderRadius.all(Radius.circular(15)),
  //     ),
  //     margin: isMe
  //         ? EdgeInsets.only(top: 20, left: 100)
  //         : EdgeInsets.only(
  //             top: 20,
  //           ),
  //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //     width: MediaQuery.of(context).size.width * 0.75,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           message.time,
  //           style: TextStyle(
  //             color: Colors.blueGrey,
  //             fontSize: 12.0,
  //           ),
  //         ),
  //         Text(
  //           message.text,
  //           style: TextStyle(
  //             color: Colors.black87,
  //             fontSize: 15.0,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  //   if (isMe) {
  //     return msg;
  //   }
  //   return Row(
  //     children: [
  //       msg,
  //       IconButton(
  //         icon: message.isLiked
  //             ? Icon(Icons.favorite)
  //             : Icon(Icons.favorite_border),
  //         iconSize: 30.0,
  //         color: message.isLiked ? Colors.red : Colors.blueGrey,
  //         onPressed: () {},
  //       )
  //     ],
  //   );
  // }

  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "name",
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
      children: [
        TextFormField(
          decoration: InputDecoration(hintText: "Send something?"),
          controller: _textController,
        ),
        _sendButton()
      ],
    );
  }

  Widget _sendButton() {
    return BlocListener<TalkBloc, TalkState>(
      listener: (context, state) {
        if (state.formStatus is SubmissionSucess) {
          _showSnackBar(context, 'Sent');
        }
        print(state.formStatus);
      },
      child: BlocBuilder<TalkBloc, TalkState>(
        builder: (context, state) {
          return state.formStatus is FormSubmitting
              ? CircularProgressIndicator()
              : IconButton(
                  onPressed: () {
                    context.read<TalkBloc>().add(SentMessageEvent(
                        message:
                            Message(sender: 'me', text: _textController.text)));
                    _textController.text = '';
                  },
                  icon: Icon(Icons.open_in_browser),
                );
        },
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
