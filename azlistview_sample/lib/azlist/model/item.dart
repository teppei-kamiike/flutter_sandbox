import 'package:azlistview/azlistview.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item extends ISuspensionBean {
  final String name;
  final DateTime createdDate;
  String? suspentionTag;

  Item({required this.name, required this.createdDate, this.suspentionTag});

  static Item fromJson(Map<String, dynamic> json) => Item(
        name: json['name'] as String,
        createdDate: DateTime.parse(json['createdDate'] as String),
        suspentionTag: json['suspentionTag'] as String?,
      );

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  String getSuspensionTag() {
    return suspentionTag!;
  }
}
