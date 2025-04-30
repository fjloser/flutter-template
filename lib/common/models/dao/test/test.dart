class TestModel {
  int? total;
  List<Items>? items;

  TestModel({this.total, this.items});

  TestModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    if (items != null) {
      data['items'] = items?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? userName;
  int? total;
  String? startTime;
  String? status;
  double? percent;

  Items(
      {this.id,
      this.userName,
      this.total,
      this.startTime,
      this.status,
      this.percent});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    total = json['total'];
    startTime = json['startTime'];
    status = json['status'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['total'] = total;
    data['startTime'] = startTime;
    data['status'] = status;
    data['percent'] = percent;
    return data;
  }
}
