class SearchResponse {
  String msg;
  bool status;
  SearchResultDataResponse data;

  SearchResponse({this.msg, this.status, this.data});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new SearchResultDataResponse.fromJson(json['data'])
        : null;
    status = json['status'];
    msg = json['msg'];
  }


}
class SearchReq{
  String lang;
  String token;
  String word;
  int page;
  int type;


  SearchReq(this.lang, this.token, this.word, this.page, this.type);

  Map<String, dynamic> searchToMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lang'] = lang;
    data['token'] = token;
    data['keyword'] = word;
    data['page'] = page;
    data['type'] = type;
    return data;
  }
}

class SearchResultDataResponse {
  List<ProductOrService> productOrService;
  String total;

  SearchResultDataResponse({this.productOrService, this.total});

  SearchResultDataResponse.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['items'] != null) {
      productOrService = new List<ProductOrService>();
      json['items'].forEach((v) {
        productOrService.add(new ProductOrService.fromJson(v));
      });
    }
  }
}

class ProductOrService {
  int id;
  String name;
  String rating;
  Image image;
  bool isFav;

  ProductOrService.fromJson(Map<String, dynamic> json) {
    image = json['base_image'] != null
        ? new Image.fromJson(json['base_image'])
        : null;
    id = json['id'];
    name = json['name'];
    rating = json['rating_percent'];
    isFav = json['is_wishlist'];
  }
}

class Image {
  int id;
  String path;

  Image(this.path);

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
  }
}
