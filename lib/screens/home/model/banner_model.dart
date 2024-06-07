/// title : "Product A"
/// subtitle : "Description of Product A"
/// discount : 10.5

class BannerModel {
  BannerModel({
      String? title, 
      String? subtitle, 
      num? discount,}){
    _title = title;
    _subtitle = subtitle;
    _discount = discount;
}

  BannerModel.fromJson(dynamic json) {
    _title = json['title'];
    _subtitle = json['subtitle'];
    _discount = json['discount'];
  }
  String? _title;
  String? _subtitle;
  num? _discount;
BannerModel copyWith({  String? title,
  String? subtitle,
  num? discount,
}) => BannerModel(  title: title ?? _title,
  subtitle: subtitle ?? _subtitle,
  discount: discount ?? _discount,
);
  String? get title => _title;
  String? get subtitle => _subtitle;
  num? get discount => _discount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['subtitle'] = _subtitle;
    map['discount'] = _discount;
    return map;
  }

}