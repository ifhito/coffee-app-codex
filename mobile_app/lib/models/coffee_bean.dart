class CoffeeBean {
  final int id;
  final String name;
  final String origin;
  final String variety;
  final String roastLevel;
  final String? tastingNotes;

  CoffeeBean({
    required this.id,
    required this.name,
    required this.origin,
    required this.variety,
    required this.roastLevel,
    this.tastingNotes,
  });

  factory CoffeeBean.fromJson(Map<String, dynamic> json) {
    return CoffeeBean(
      id: json['id'] as int,
      name: json['name'] as String,
      origin: json['origin'] as String,
      variety: json['variety'] as String,
      roastLevel: json['roast_level'] as String,
      tastingNotes: json['tasting_notes'] as String?,
    );
  }
}
