class SearchModel {
  List<dynamic>? searchitems;

  SearchModel({this.searchitems});

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        searchitems: json['searchitems'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'searchitems': searchitems,
      };
}
