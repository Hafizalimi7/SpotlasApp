// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

//This model was generateed based on the response from the Api endpoint using https://app.quicktype.io/

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
    DateTime createdAt;
    Author author;
    Spot spot;
    dynamic relevantComments;
    int numberOfComments;
    List<Author> likedBy;
    int numberOfLikes;
    dynamic tags;
    String url;

    factory FeedsResponse.fromJson(Map<String, dynamic> json) => FeedsResponse(
        id: json["id"],
        caption: Caption.fromJson(json["caption"]),
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
        author: Author.fromJson(json["author"]),
        spot: Spot.fromJson(json["spot"]),
        relevantComments: json["relevant_comments"],
        numberOfComments: json["number_of_comments"],
        likedBy: List<Author>.from(json["liked_by"].map((x) => Author.fromJson(x))),
        numberOfLikes: json["number_of_likes"],
        tags: json["tags"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "caption": caption.toJson(),
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
        "created_at": createdAt.toIso8601String(),
        "author": author.toJson(),
        "spot": spot.toJson(),
        "relevant_comments": relevantComments,
        "number_of_comments": numberOfComments,
        "liked_by": List<dynamic>.from(likedBy.map((x) => x.toJson())),
        "number_of_likes": numberOfLikes,
        "tags": tags,
        "url": url,
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
        id: json["id"],
        username: json["username"],
        photoUrl: json["photo_url"],
        fullName: json["full_name"],
        isPrivate: json["is_private"],
        isVerified: json["is_verified"],
        followStatus: json["follow_status"] == null ? null : json["follow_status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "photo_url": photoUrl,
        "full_name": fullName,
        "is_private": isPrivate,
        "is_verified": isVerified,
        "follow_status": followStatus == null ? null : followStatus,
    };
}

class Caption {
    Caption({
        this.text,
    });

    String text;

    factory Caption.fromJson(Map<String, dynamic> json) => Caption(
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
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
        url: json["url"],
        blurHash: json["blur_hash"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "blur_hash": blurHash,
        "type": type,
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
        id: json["id"],
        name: json["name"],
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        logo: Media.fromJson(json["logo"]),
        location: Location.fromJson(json["location"]),
        isSaved: json["is_saved"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "logo": logo.toJson(),
        "location": location.toJson(),
        "is_saved": isSaved,
    };
}

class Location {
    Location({
        this.latitude,
        this.longitude,
        this.display,
    });

    int latitude;
    int longitude;
    String display;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"],
        longitude: json["longitude"],
        display: json["display"],
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "display": display,
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
        id: json["id"],
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
    };
}
