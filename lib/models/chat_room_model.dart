class ChatRoomModel {
  List<GetAllChatroomByUsersIdContaining>? getAllChatroomByUsersIdContaining;

  ChatRoomModel({this.getAllChatroomByUsersIdContaining});

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
    if (json['getAllChatroomByUsersIdContaining'] != null) {
      getAllChatroomByUsersIdContaining = <GetAllChatroomByUsersIdContaining>[];
      json['getAllChatroomByUsersIdContaining'].forEach((v) {
        getAllChatroomByUsersIdContaining!
            .add(GetAllChatroomByUsersIdContaining.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getAllChatroomByUsersIdContaining != null) {
      data['getAllChatroomByUsersIdContaining'] =
          getAllChatroomByUsersIdContaining!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllChatroomByUsersIdContaining {
  String? id;
  User1? user1;
  User1? user2;
  Building? building;
  LastChat? lastChat;

  GetAllChatroomByUsersIdContaining(
      {this.id, this.user1, this.user2, this.building, this.lastChat});

  GetAllChatroomByUsersIdContaining.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user1 = json['user1'] != null ? User1.fromJson(json['user1']) : null;
    user2 = json['user2'] != null ? User1.fromJson(json['user2']) : null;
    building =
        json['building'] != null ? Building.fromJson(json['building']) : null;
    lastChat =
        json['lastChat'] != null ? LastChat.fromJson(json['lastChat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user1 != null) {
      data['user1'] = user1!.toJson();
    }
    if (user2 != null) {
      data['user2'] = user2!.toJson();
    }
    if (building != null) {
      data['building'] = building!.toJson();
    }
    if (lastChat != null) {
      data['lastChat'] = lastChat!.toJson();
    }
    return data;
  }
}

class User1 {
  String? id;
  String? fullname;
  String? email;
  String? image;

  User1({this.id, this.fullname, this.email, this.image});

  User1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['email'] = email;
    data['image'] = image;
    return data;
  }
}

class Building {
  String? id;
  String? name;
  String? address;
  String? image;

  Building({this.id, this.name, this.address, this.image});

  Building.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['image'] = image;
    return data;
  }
}

class LastChat {
  String? id;
  String? message;
  String? date;

  LastChat({this.id, this.message, this.date});

  LastChat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    data['date'] = date;
    return data;
  }
}
