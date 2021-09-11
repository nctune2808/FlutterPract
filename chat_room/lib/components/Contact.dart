import 'package:chat_room/models/Message.dart';
import 'package:chat_room/models/User.dart';
import 'package:chat_room/views/ChatScreen.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Favourite Contacts"),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz),
              )
            ],
          ),
        ),
        Container(
          height: 100.0,
          child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: favourites.length,
              itemBuilder: (BuildContext context, int index) {
                final User favContact = favourites[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ChatScreen(user: favContact)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.lightBlueAccent,
                          backgroundImage: AssetImage(favourites[index].avatar),
                        ),
                        Text(favourites[index].name),
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
