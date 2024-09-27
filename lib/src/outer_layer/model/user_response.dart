import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';

part 'user_response.g.dart';


@JsonSerializable(explicitToJson: true)
class UserResponse {
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "contents")
  final List<Content>? contents;
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "image_url")
  final String? imageUrl;

  UserResponse({
    required this.type,
    required this.title,
    this.contents,
    required this.id,
    this.imageUrl,
  });


  UserResponse copyWith({
    String? type,
    String? title,
    List<Content>? contents,
    String? id,
    String? imageUrl,
  }) =>
      UserResponse(
        type: type ?? this.type,
        title: title ?? this.title,
        contents: contents ?? this.contents,
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class Content {
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @JsonKey(name: "sku")
  final String? sku;
  @JsonKey(name: "product_name")
  final String? productName;
  @JsonKey(name: "product_image")
  final String? productImage;
  @JsonKey(name: "product_rating")
  final int? productRating;
  @JsonKey(name: "actual_price")
  final String? actualPrice;
  @JsonKey(name: "offer_price")
  final String? offerPrice;
  @JsonKey(name: "discount")
  final String? discount;

  Content({
    this.title,
    this.imageUrl,
    this.sku,
    this.productName,
    this.productImage,
    this.productRating,
    this.actualPrice,
    this.offerPrice,
    this.discount,
  });

  Content copyWith({
    String? title,
    String? imageUrl,
    String? sku,
    String? productName,
    String? productImage,
    int? productRating,
    String? actualPrice,
    String? offerPrice,
    String? discount,
  }) =>
      Content(
        title: title ?? this.title,
        imageUrl: imageUrl ?? this.imageUrl,
        sku: sku ?? this.sku,
        productName: productName ?? this.productName,
        productImage: productImage ?? this.productImage,
        productRating: productRating ?? this.productRating,
        actualPrice: actualPrice ?? this.actualPrice,
        offerPrice: offerPrice ?? this.offerPrice,
        discount: discount ?? this.discount,
      );

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
