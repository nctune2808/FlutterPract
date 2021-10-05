import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

  final _firestore = FirebaseFirestore.instance;
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: Text("fetch"),
            // child: ListView.builder(
            //   reverse: true,
            //   itemCount: messages.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     final Message message = messages[index];
            //     bool isMe = message.sender.id == admin.id;
            //     return _buildMessage(message, isMe);
            //   },
            // ),
          ),
          SafeArea(
            minimum: EdgeInsets.all(30),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Send something?"),
              validator: (value) {},
              onChanged: (value) {},
              onFieldSubmitted: (value) {
                _firestore
                    .collection('messages')
                    .add({'text': value, 'sender': "me"});
              },
            ),
            // IconButton(onPressed: () {}, icon: Icon(Icons.send))
          ),
        ],
      ),
    );
  }
}
