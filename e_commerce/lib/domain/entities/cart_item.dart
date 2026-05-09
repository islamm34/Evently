import 'package:freezed_annotation/freezed_annotation.dart';


@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required String productId,
    required String name,
    required double price,
    required int quantity,
    String? image,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
}
