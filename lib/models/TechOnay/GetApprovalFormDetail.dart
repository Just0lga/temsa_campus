class TechOnay_GetApprovalFormDetail {
  String? turu;
  String? processId;
  String? gun;
  String? currency;
  String? detailHtml;
  String? id;
  bool? isActive;

  TechOnay_GetApprovalFormDetail(
      {this.turu,
      this.processId,
      this.gun,
      this.currency,
      this.detailHtml,
      this.id,
      this.isActive});

  TechOnay_GetApprovalFormDetail.fromJson(Map<String, dynamic> json) {
    turu = json['turu'];
    processId = json['processId'];
    gun = json['gun'];
    currency = json['currency'];
    detailHtml = json['detailHtml'];
    id = json['id'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['turu'] = this.turu;
    data['processId'] = this.processId;
    data['gun'] = this.gun;
    data['currency'] = this.currency;
    data['detailHtml'] = this.detailHtml;
    data['id'] = this.id;
    data['isActive'] = this.isActive;
    return data;
  }
}
