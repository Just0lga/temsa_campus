class TechOnay_GetApprovalForms {
  List<Data>? data;
  List<String>? messages;

  TechOnay_GetApprovalForms({this.data, this.messages});

  TechOnay_GetApprovalForms.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    messages = json['messages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['messages'] = this.messages;
    return data;
  }
}

class Data {
  String? turu;
  String? processId;
  int? formId;
  String? gun;
  String? currency;
  String? listHtml;
  String? cardHtml;
  String? id;
  bool? isActive;

  Data(
      {this.turu,
      this.processId,
      this.formId,
      this.gun,
      this.currency,
      this.listHtml,
      this.cardHtml,
      this.id,
      this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    turu = json['turu'];
    processId = json['processId'];
    formId = json['formId'];
    gun = json['gun'];
    currency = json['currency'];
    listHtml = json['listHtml'];
    cardHtml = json['cardHtml'];
    id = json['id'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['turu'] = this.turu;
    data['processId'] = this.processId;
    data['formId'] = this.formId;
    data['gun'] = this.gun;
    data['currency'] = this.currency;
    data['listHtml'] = this.listHtml;
    data['cardHtml'] = this.cardHtml;
    data['id'] = this.id;
    data['isActive'] = this.isActive;
    return data;
  }
}
/*class TechOnay_GetApprovalForms {
  List<Data>? data;
  List<String>? messages;

  TechOnay_GetApprovalForms({this.data, this.messages});

  TechOnay_GetApprovalForms.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    messages = json['messages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['messages'] = this.messages;
    return data;
  }
}

class Data {
  String? turu;
  String? processId;
  int? formId;
  String? gun;
  String? currency;
  String? listHtml;
  String? cardHtml;
  String? id;
  bool? isActive;

  Data(
      {this.turu,
      this.processId,
      this.formId,
      this.gun,
      this.currency,
      this.listHtml,
      this.cardHtml,
      this.id,
      this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    turu = json['turu'];
    processId = json['processId'];
    formId = json['formId'];
    gun = json['gun'];
    currency = json['currency'];
    listHtml = json['listHtml'];
    cardHtml = json['cardHtml'];
    id = json['id'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['turu'] = this.turu;
    data['processId'] = this.processId;
    data['formId'] = this.formId;
    data['gun'] = this.gun;
    data['currency'] = this.currency;
    data['listHtml'] = this.listHtml;
    data['cardHtml'] = this.cardHtml;
    data['id'] = this.id;
    data['isActive'] = this.isActive;
    return data;
  }
}*/
