import 'package:chat_room/models/Message.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

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
          height: 120.0,
          child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: favourites.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
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
                );
              }),
        )
      ],
    );
  }
}
