class ApiModel {
  String? url;

  ApiModel({this.url});

  ApiModel.fromJson(Map<dynamic, dynamic> json) {
    if (json["url"] is String) {
      url = json["url"];
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data["url"] = url;
    return data;
  }
}
