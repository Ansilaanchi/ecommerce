import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class Review extends HiveObject {
  @HiveField(0)
  final String text;

  Review({required this.text});
}
