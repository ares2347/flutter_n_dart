class Place {
  String? placeId;
  String? name;
  int? rating;
  String? thumbnail;


  Place({this.placeId, this.name, this.rating, this.thumbnail});

  factory Place.valueFromJson(Map<String, dynamic> json) {
    return Place(
        placeId: json["placeId"] as String,
        name: json["name"] as String,
        rating: json["rating"] as int,
        thumbnail: json["thumbnail"] as String
    );
  }
}