class TechOnay_GetAllProcessCount {
  Data? data;
  List<String>? messages;

  TechOnay_GetAllProcessCount({this.data, this.messages});

  TechOnay_GetAllProcessCount.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    messages = json['messages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['messages'] = this.messages;
    return data;
  }
}

class Data {
  int? count;
  bool? isVisible;
  bool? isApproveTechOnay;
  String? id;
  bool? isActive;

  Data(
      {this.count,
      this.isVisible,
      this.isApproveTechOnay,
      this.id,
      this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    isVisible = json['isVisible'];
    isApproveTechOnay = json['isApproveTechOnay'];
    id = json['id'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['isVisible'] = this.isVisible;
    data['isApproveTechOnay'] = this.isApproveTechOnay;
    data['id'] = this.id;
    data['isActive'] = this.isActive;
    return data;
  }
}
