import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id;
  final String? name;
  final String? category;

  const Product({this.id, this.name, this.category});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as String?,
        name: json['name'] as String?,
        category: json['category'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
      };

  @override
  List<Object?> get props => [id, name, category];
}
