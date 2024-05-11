import 'searchitem.dart';

class Searchitems {
  List<Searchitem>? searchitems;
  Searchitem? data;

  Searchitems({this.searchitems});

  factory Searchitems.fromJson(Map<String, dynamic> json) => Searchitems(
        searchitems: (json['searchitems'] as List<dynamic>?)
            ?.map((e) => Searchitem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'searchitems': searchitems?.map((e) => e.toJson()).toList(),
      };
}
