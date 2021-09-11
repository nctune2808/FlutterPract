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

List<User> favourites = [messi, dejong, garcia, stegen, pique, pedri];

List<Message> chats = [
  Message(
    sender: messi,
    time: "11:00",
    text:
        "Hello, I am Messi. How are you doing? Do you want to join with my team?",
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: stegen,
    time: "14:00",
    text:
        "Hello, I am Stegen. How are you doing? Do you want to join with my team?",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: pique,
    time: "17:00",
    text:
        "Hello, I am Pique. How are you doing? Do you want to join with my team?",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: garcia,
    time: "18:00",
    text:
        "Hello, I am Garcia. How are you doing? Do you want to join with my team?",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: dejong,
    time: "20:00",
    text:
        "Hello, I am DeJong. How are you doing? Do you want to join with my team?",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: pedri,
    time: "22:00",
    text:
        "Hello, I am Pedri. How are you doing? Do you want to join with my team?",
    isLiked: false,
    unread: true,
  ),
];

List<Message> messages = [
  Message(
    sender: admin,
    time: "19:00",
    text:
        "Bye, my idol. See you next week. Be safe, be strong, be fabulos ever Messi. Always support you!",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: messi,
    time: "18:00",
    text: "Great, good to hear that! See you then. Bye!",
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: admin,
    time: "17:00",
    text:
        "Yeah definitely. I would love to visit Camp Nou one day. I can make it on Wed next week",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: messi,
    time: "16:00",
    text: "Nice, Do you want to join with us?",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: admin,
    time: "15:00",
    text: "I play at defender (CDM,CB,RB,RBW)",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: messi,
    time: "14:00",
    text: "So, which position do you play?",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: admin,
    time: "13:00",
    text:
        "I graduated bachelor of computer science with first class achievement last month.",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: messi,
    time: "12:00",
    text: "What do you do?",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: admin,
    time: "11:00",
    text: "It is 28/08/1998.",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: messi,
    time: "10:00",
    text: "So, when is your birthday?",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: admin,
    time: "09:00",
    text: "Currently, I live in London, England, UK.",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: messi,
    time: "08:00",
    text: "Where do you live now?",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: admin,
    time: "07:00",
    text: "I am from Vietnam. It locates Southeast Asian.",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: messi,
    time: "06:00",
    text: "Where are you from?",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: admin,
    time: "05:00",
    text: "Yeah, Of course. Please go ahead sir.",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: messi,
    time: "04:00",
    text: "Hahaha. Right before we start, may I ask you some question?",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: admin,
    time: "03:00",
    text:
        "Honestly, I am feel realy exciting because I can not believe that my idol inbox me",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: messi,
    time: "02:00",
    text: "Yeah, I am very good. Just finished workout by now. How are you?",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: admin,
    time: "01:00",
    text: "Damn, hello GOAT. How are you doing boss?",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: messi,
    time: "00:00",
    text: "Hello dude",
    isLiked: false,
    unread: true,
  ),
];
