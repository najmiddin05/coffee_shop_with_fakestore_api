class Rate {
  num rate;
  int count;
  Rate({
    required this.rate,
    required this.count,
  });

  Rate copyWith({
    num? rate,
    int? count,
  }) {
    return Rate(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'rate': rate,
      'count': count,
    };
  }

  factory Rate.fromJson(Map<String, Object?> map) {
    return Rate(
      rate: map['rate'] as num,
      count: map['count'] as int,
    );
  }

  @override
  String toString() => 'Rate(rate: $rate, count: $count)';

  @override
  bool operator ==(covariant Rate other) {
    if (identical(this, other)) return true;

    return other.rate == rate && other.count == count;
  }

  @override
  int get hashCode => rate.hashCode ^ count.hashCode;
}
