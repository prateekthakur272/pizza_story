class Macros{
  int calories;
  int proteins;
  int fat;
  int carbs;

  Macros({
    required this.calories,
    required this.proteins,
    required this.fat,
    required this.carbs,
  });

  Map<String, dynamic> toMap(){
    return {
      'calories': calories,
      'proteins': proteins,
      'fat': fat,
      'carbs': carbs,
    };
  }

  static Macros fromMap(Map<String, dynamic> map){
    return Macros(
      calories: map['calories'],
      proteins: map['proteins'],
      fat: map['fat'],
      carbs: map['carbs'],
    );
  }
}