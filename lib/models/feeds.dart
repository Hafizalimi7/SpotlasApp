// To parse this JSON data, do
//
//     final feedsResponse = feedsResponseFromJson(jsonString);

import 'dart:convert';

List<FeedsResponse> feedsResponseFromJson(String str) => List<FeedsResponse>.from(json.decode(str).map((x) => FeedsResponse.fromJson(x)));

String feedsResponseToJson(List<FeedsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeedsResponse {
  FeedsResponse({
    this.id,
    this.caption,
    this.media,
    this.createdAt,
    this.author,
    this.spot,
    this.relevantComments,
    this.numberOfComments,
    this.likedBy,
    this.numberOfLikes,
    this.tags,
    this.url,
  });

  String id;
  Caption caption;
  List<Media> media;
  String createdAt;
  Author author;
  Spot spot;
  dynamic relevantComments;
  int numberOfComments;
  List<Author> likedBy;
  int numberOfLikes;
  dynamic tags;
  String url;

  factory FeedsResponse.fromJson(Map<String, dynamic> json) => FeedsResponse(
    id: json["id"] == null ? null : json["id"],
    caption: json["caption"] == null ? null : Caption.fromJson(json["caption"]),
    media: json["media"] == null ? null : List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
    createdAt: json["created_at"] == null ? null : json["created_at"],
    author: json["author"] == null ? null : Author.fromJson(json["author"]),
    spot: json["spot"] == null ? null : Spot.fromJson(json["spot"]),
    relevantComments: json["relevant_comments"],
    numberOfComments: json["number_of_comments"] == null ? null : json["number_of_comments"],
    likedBy: json["liked_by"] == null ? null : List<Author>.from(json["liked_by"].map((x) => Author.fromJson(x))),
    numberOfLikes: json["number_of_likes"] == null ? null : json["number_of_likes"],
    tags: json["tags"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "caption": caption == null ? null : caption.toJson(),
    "media": media == null ? null : List<dynamic>.from(media.map((x) => x.toJson())),
    "created_at": createdAt == null ? null : createdAt,
    "author": author == null ? null : author.toJson(),
    "spot": spot == null ? null : spot.toJson(),
    "relevant_comments": relevantComments,
    "number_of_comments": numberOfComments == null ? null : numberOfComments,
    "liked_by": likedBy == null ? null : List<dynamic>.from(likedBy.map((x) => x.toJson())),
    "number_of_likes": numberOfLikes == null ? null : numberOfLikes,
    "tags": tags,
    "url": url == null ? null : url,
  };
}

class Author {
  Author({
    this.id,
    this.username,
    this.photoUrl,
    this.fullName,
    this.isPrivate,
    this.isVerified,
    this.followStatus,
  });

  String id;
  String username;
  String photoUrl;
  String fullName;
  bool isPrivate;
  bool isVerified;
  String followStatus;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    id: json["id"] == null ? null : json["id"],
    username: json["username"] == null ? null : json["username"],
    photoUrl: json["photo_url"] == null ? null : json["photo_url"],
    fullName: json["full_name"] == null ? null : json["full_name"],
    isPrivate: json["is_private"] == null ? null : json["is_private"],
    isVerified: json["is_verified"] == null ? null : json["is_verified"],
    followStatus: json["follow_status"] == null ? null : json["follow_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "username": username == null ? null : username,
    "photo_url": photoUrl == null ? null : photoUrl,
    "full_name": fullName == null ? null : fullName,
    "is_private": isPrivate == null ? null : isPrivate,
    "is_verified": isVerified == null ? null : isVerified,
    "follow_status": followStatus == null ? null : followStatus,
  };
}

class Caption {
  Caption({
    this.text,
    this.tags,
  });

  String text;
  List<Tag> tags;

  factory Caption.fromJson(Map<String, dynamic> json) => Caption(
    text: json["text"] == null ? null : json["text"],
    tags: json["tags"] == null ? null : List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "text": text == null ? null : text,
    "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x.toJson())),
  };
}

class Tag {
  Tag({
    this.id,
    this.tagText,
    this.displayText,
    this.url,
    this.type,
  });

  String id;
  String tagText;
  String displayText;
  String url;
  String type;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["id"] == null ? null : json["id"],
    tagText: json["tag_text"] == null ? null : json["tag_text"],
    displayText: json["display_text"] == null ? null : json["display_text"],
    url: json["url"] == null ? null : json["url"],
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "tag_text": tagText == null ? null : tagText,
    "display_text": displayText == null ? null : displayText,
    "url": url == null ? null : url,
    "type": type == null ? null : type,
  };
}

class Media {
  Media({
    this.url,
    this.blurHash,
    this.type,
  });

  String url;
  String blurHash;
  String type;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    url: json["url"] == null ? null : json["url"],
    blurHash: json["blur_hash"] == null ? null : json["blur_hash"],
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "blur_hash": blurHash == null ? null : blurHash,
    "type": type == null ? null : type,
  };
}

class Spot {
  Spot({
    this.id,
    this.name,
    this.types,
    this.logo,
    this.location,
    this.isSaved,
  });

  String id;
  String name;
  List<Type> types;
  Media logo;
  Location location;
  bool isSaved;

  factory Spot.fromJson(Map<String, dynamic> json) => Spot(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    types: json["types"] == null ? null : List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
    logo: json["logo"] == null ? null : Media.fromJson(json["logo"]),
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    isSaved: json["is_saved"] == null ? null : json["is_saved"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "types": types == null ? null : List<dynamic>.from(types.map((x) => x.toJson())),
    "logo": logo == null ? null : logo.toJson(),
    "location": location == null ? null : location.toJson(),
    "is_saved": isSaved == null ? null : isSaved,
  };
}

class Location {
  Location({
    this.latitude,
    this.longitude,
    this.display,
  });

  double latitude;
  double longitude;
  String display;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
    longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
    display: json["display"] == null ? null : json["display"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "display": display == null ? null : display,
  };
}

class Type {
  Type({
    this.id,
    this.name,
    this.url,
  });

  int id;
  String name;
  String url;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "url": url == null ? null : url,
  };
}