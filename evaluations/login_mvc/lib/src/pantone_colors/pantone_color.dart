class PantoneColor {
  final int id;
  final String name;
  final int year;
  final String color;
  final String pantoneValue;

  PantoneColor({
    this.id,
    this.name,
    this.year,
    this.color,
    this.pantoneValue,
  });

  PantoneColor.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        year = json['year'],
        color = json['color'],
        pantoneValue = json['pantone_value'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'year': year,
      'color': color,
      'pantone_value': pantoneValue,
    };
  }
}
