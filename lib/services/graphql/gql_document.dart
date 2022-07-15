String getChatRoom = """
  query GetAllChatroomByUsersIdContains(\$idUser : Int!) {
    getAllChatroomByUsersIdContaining(idUser: \$idUser){
      id
      user1 {
        id
        fullname
        email
        image
      }
      user2 {
        id
        fullname
        email
        image
      }
      building {
        id
        name
        image
      }
      lastChat {
        id
        message
        date
      }
    }
  }
""";

String getMessageAtRoom = """
query GetAllChatByChatRoomId (\$idRoom : Int!) {
  getAllChatByChatroomId(idChatroom : \$idRoom) {
    id
    message
    date
    sender {
      id
      fullname
      email
      image
    }
    target {
      id
      fullname
      email
      image
    }
  }
}
""";

String getMessageAtRoomByIdBuilding = """
query GetAllChatByUsersIdAndBuildingId(\$idBuilding : Int!, \$idUser : Int!) {
  getAllChatByUsersIdAndBuildingId(idUser1: \$idUser, idUser2: 1, buildingId: \$idBuilding) {
    id
    message
    date
    sender {
      id
      fullname
      email
      image
    }
    target {
      id
      fullname
      email
      image
    }
  }
}
""";

String sendMessage = """
mutation SendChat(\$idUser : Int! , \$idBuilding : Int!, \$message : String!) {
  sendChat(idSender: \$idUser, idTarget: 1, idBuilding: \$idBuilding , message: \$message) {
    id
    message
    date
    chatroom {
      id
      user1 {
        id
        fullname
        email
      }
      user2 {
        id
        fullname
        email
      }
      building {
        id
        name
      }
    }
  }
}
""";
