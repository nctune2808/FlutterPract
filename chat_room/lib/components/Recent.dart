import 'package:chat_room/models/Message.dart';
import 'package:flutter/material.dart';

class Recent extends StatelessWidget {
  const Recent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      // color: Colors.blue,
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          final Message chat = chats[index];
          return Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: chat.unread ? Color(0xFFFFFEFEE) : null,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage: AssetImage(chat.sender.avatar),
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          chat.sender.name,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            chat.text.last,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      chat.time,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    chat.unread
                        ? Container(
                            width: 20,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              chat.text.length.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
