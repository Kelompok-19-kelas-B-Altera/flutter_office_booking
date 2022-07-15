class MessageModel {
  List<GetAllChatByUsersIdAndBuildingId>? getAllChatByUsersIdAndBuildingId;

  MessageModel({this.getAllChatByUsersIdAndBuildingId});

  MessageModel.fromJson(Map<String, dynamic> json) {
    if (json['getAllChatByUsersIdAndBuildingId'] != null) {
      getAllChatByUsersIdAndBuildingId = <GetAllChatByUsersIdAndBuildingId>[];
      json['getAllChatByUsersIdAndBuildingId'].forEach((v) {
        getAllChatByUsersIdAndBuildingId!
            .add(GetAllChatByUsersIdAndBuildingId.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getAllChatByUsersIdAndBuildingId != null) {
      data['getAllChatByUsersIdAndBuildingId'] =
          getAllChatByUsersIdAndBuildingId!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllChatByUsersIdAndBuildingId {
  String? id;
  String? message;
  String? date;
  Sender? sender;
  Sender? target;

  GetAllChatByUsersIdAndBuildingId(
      {this.id, this.message, this.date, this.sender, this.target});

  GetAllChatByUsersIdAndBuildingId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    date = json['date'];
    sender = json['sender'] != null ? Sender.fromJson(json['sender']) : null;
    target = json['target'] != null ? Sender.fromJson(json['target']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    data['date'] = date;
    if (sender != null) {
      data['sender'] = sender!.toJson();
    }
    if (target != null) {
      data['target'] = target!.toJson();
    }
    return data;
  }
}

class Sender {
  String? id;
  String? fullname;
  String? email;
  String? image;

  Sender({this.id, this.fullname, this.email, this.image});

  Sender.fromJson(Map<String, dynamic> json) {
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
