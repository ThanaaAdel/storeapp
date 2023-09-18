class Rating {
  num? rate;
  num? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: num.tryParse(json['rate'].toString()),
        count: num.tryParse(json['count'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (rate != null) 'rate': rate,
        if (count != null) 'count': count,
      };
}
