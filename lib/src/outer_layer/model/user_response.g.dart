// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      type: json['type'] as String,
      title: json['title'] as String,
      contents: (json['contents'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'contents': instance.contents,
      'id': instance.id,
      'image_url': instance.imageUrl,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      title: json['title'] as String?,
      imageUrl: json['image_url'] as String?,
      sku: json['sku'] as String?,
      productName: json['product_name'] as String?,
      productImage: json['product_image'] as String?,
      productRating: (json['product_rating'] as num?)?.toInt(),
      actualPrice: json['actual_price'] as String?,
      offerPrice: json['offer_price'] as String?,
      discount: json['discount'] as String?,
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'title': instance.title,
      'image_url': instance.imageUrl,
      'sku': instance.sku,
      'product_name': instance.productName,
      'product_image': instance.productImage,
      'product_rating': instance.productRating,
      'actual_price': instance.actualPrice,
      'offer_price': instance.offerPrice,
      'discount': instance.discount,
    };
