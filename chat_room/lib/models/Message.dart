import 'package:chat_room/models/User.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.unread,
  });
}

final User admin = User(
  id: 0,
  name: "Admin",
  avatar: "assets/images/logo_Barcelona.png",
);

final User messi = User(
  id: 1,
  name: "Messi",
  avatar: "assets/images/Messi_avt.png",
);

final User stegen = User(
  id: 2,
  name: "Stegen",
  avatar: "assets/images/Stegen_avt.png",
);

final User pique = User(
  id: 3,
  name: "Pique",
  avatar: "assets/images/Pique_avt.png",
);

final User garcia = User(
  id: 4,
  name: "Garcia",
  avatar: "assets/images/Garcia_avt.png",
);

final User dejong = User(
  id: 5,
  name: "DeJong",
  avatar: "assets/images/DeJong_avt.png",
);

final User pedri = User(
  id: 6,
  name: "Pedri",
  avatar: "assets/images/Pedri_avt.png",
);

List<User> favourites = [messi, stegen, pique, garcia, dejong, pedri];

List<Message> chats = [
  Message(
    sender: messi,
    time: "11:00 AM",
    text: "Hello, I am Messi",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: stegen,
    time: "14:00 PM",
    text: "Hello, I am Stegen",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: pique,
    time: "17:00 PM",
    text: "Hello, I am Pique",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: garcia,
    time: "18:00 PM",
    text: "Hello, I am Garcia",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: dejong,
    time: "20:00 PM",
    text: "Hello, I am DeJong",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: pedri,
    time: "22:00 PM",
    text: "Hello, I am Pedri",
    isLiked: false,
    unread: true,
  ),
];
