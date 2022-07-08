class SearchBuildingModel {
  String? timestamp;
  int? responseCode;
  String? message;
  Data? data;

  SearchBuildingModel(
      {this.timestamp, this.responseCode, this.message, this.data});

  SearchBuildingModel.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    responseCode = json['response_code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['response_code'] = responseCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Content>? content;
  Pageable? pageable;
  bool? last;
  int? totalPages;
  int? totalElements;
  Sort? sort;
  bool? first;
  int? size;
  int? number;
  int? numberOfElements;
  bool? empty;

  Data(
      {this.content,
      this.pageable,
      this.last,
      this.totalPages,
      this.totalElements,
      this.sort,
      this.first,
      this.size,
      this.number,
      this.numberOfElements,
      this.empty});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(Content.fromJson(v));
      });
    }
    pageable =
        json['pageable'] != null ? Pageable.fromJson(json['pageable']) : null;
    last = json['last'];
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    first = json['first'];
    size = json['size'];
    number = json['number'];
    numberOfElements = json['numberOfElements'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    if (pageable != null) {
      data['pageable'] = pageable!.toJson();
    }
    data['last'] = last;
    data['totalPages'] = totalPages;
    data['totalElements'] = totalElements;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['first'] = first;
    data['size'] = size;
    data['number'] = number;
    data['numberOfElements'] = numberOfElements;
    data['empty'] = empty;
    return data;
  }
}

class Content {
  int? id;
  String? buildingName;
  String? description;
  int? totalRoom;
  int? roomSpace;
  String? address;
  List<ImagesModel>? images;
  int? totalView;
  Complex? complex;
  List<NearbyFacilities>? nearbyFacilities;
  List<Schedules>? schedules;
  List<Reviews>? reviews;

  Content(
      {this.id,
      this.buildingName,
      this.description,
      this.totalRoom,
      this.roomSpace,
      this.address,
      this.images,
      this.totalView,
      this.complex,
      this.nearbyFacilities,
      this.schedules,
      this.reviews});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    buildingName = json['building_name'];
    description = json['description'];
    totalRoom = json['total_room'];
    roomSpace = json['room_space'];
    address = json['address'];
    if (json['images'] != null) {
      images = <ImagesModel>[];
      json['images'].forEach((v) {
        images!.add(ImagesModel.fromJson(v));
      });
    }
    totalView = json['total_view'];
    complex =
        json['complex'] != null ? Complex.fromJson(json['complex']) : null;
    if (json['nearby_facilities'] != null) {
      nearbyFacilities = <NearbyFacilities>[];
      json['nearby_facilities'].forEach((v) {
        nearbyFacilities!.add(NearbyFacilities.fromJson(v));
      });
    }
    if (json['schedules'] != null) {
      schedules = <Schedules>[];
      json['schedules'].forEach((v) {
        schedules!.add(Schedules.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['building_name'] = buildingName;
    data['description'] = description;
    data['total_room'] = totalRoom;
    data['room_space'] = roomSpace;
    data['address'] = address;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['total_view'] = totalView;
    if (complex != null) {
      data['complex'] = complex!.toJson();
    }
    if (nearbyFacilities != null) {
      data['nearby_facilities'] =
          nearbyFacilities!.map((v) => v.toJson()).toList();
    }
    if (schedules != null) {
      data['schedules'] = schedules!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImagesModel {
  int? id;
  String? imageUrl;

  ImagesModel({this.id, this.imageUrl});

  ImagesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_url'] = imageUrl;
    return data;
  }
}

class Schedules {
  int? id;
  String? imageUrl;

  Schedules({this.id, this.imageUrl});

  Schedules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_url'] = imageUrl;
    return data;
  }
}

class Complex {
  int? id;
  String? city;

  Complex({this.id, this.city});

  Complex.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['city'] = city;
    return data;
  }
}

class NearbyFacilities {
  int? id;
  String? name;
  String? type;
  int? distance;

  NearbyFacilities({this.id, this.name, this.type});

  NearbyFacilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['distance'] = distance;
    return data;
  }
}

class Reviews {
  String? review;
  int? rating;
  User? user;

  Reviews({this.review, this.rating, this.user});

  Reviews.fromJson(Map<String, dynamic> json) {
    review = json['review'];
    rating = json['rating'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['review'] = review;
    data['rating'] = rating;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? fullname;
  Null? email;
  Null? images;

  User({this.id, this.fullname, this.email, this.images});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    email = json['email'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['email'] = email;
    data['images'] = images;
    return data;
  }
}

class Pageable {
  Sort? sort;
  int? pageNumber;
  int? pageSize;
  int? offset;
  bool? paged;
  bool? unpaged;

  Pageable(
      {this.sort,
      this.pageNumber,
      this.pageSize,
      this.offset,
      this.paged,
      this.unpaged});

  Pageable.fromJson(Map<String, dynamic> json) {
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    offset = json['offset'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    data['offset'] = offset;
    data['paged'] = paged;
    data['unpaged'] = unpaged;
    return data;
  }
}

class Sort {
  bool? sorted;
  bool? empty;
  bool? unsorted;

  Sort({this.sorted, this.empty, this.unsorted});

  Sort.fromJson(Map<String, dynamic> json) {
    sorted = json['sorted'];
    empty = json['empty'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sorted'] = sorted;
    data['empty'] = empty;
    data['unsorted'] = unsorted;
    return data;
  }
}
