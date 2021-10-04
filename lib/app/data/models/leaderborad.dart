class Rating {
  List<RatingPlace> rp;
  Rating({
    required this.rp,
  });
}

class RatingPlace {
  String name;
  String scores;
  RatingPlace({
    required this.name,
    required this.scores,
  });
}
