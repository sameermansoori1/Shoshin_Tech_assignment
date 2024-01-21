import 'dart:ffi';

class Brand {
  String? brandId;
  String? title;
  String? logo;

  Brand({this.brandId, this.title, this.logo});

  Brand.fromJson(Map<String, dynamic> json) {
    brandId = json['brandId'];
    title = json['title'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['brandId'] = brandId;
    data['title'] = title;
    data['logo'] = logo;
    return data;
  }
}

class CustomData {
  double? apprating;
  String? wallurl;
  String? dominantcolor;

  CustomData({this.apprating, this.wallurl, this.dominantcolor});

  CustomData.fromJson(Map<String, dynamic> json) {
    apprating = json['app_rating'];
    wallurl = json['wall_url'];
    dominantcolor = json['dominant_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['app_rating'] = apprating;
    data['wall_url'] = wallurl;
    data['dominant_color'] = dominantcolor;
    return data;
  }
}

class TaskModel {
  String? taskId;
  String? title;
  String? thumbnail;
  String? shortDesc;
  String? payout;
  String? ctaShort;
  String? ctaLong;
  String? type;
  String? totallead;
  bool ? isTrending;
  String? earned;
  String? status;
  String ? isCompleted;
  Brand? brand;
  int? payoutamt;
  String? payoutcurrency;
  String? ctaAction;
  CustomData? customdata;

  TaskModel({this.taskId, this.title, this.thumbnail, this.shortDesc, this.payout, this.ctaShort, this.ctaLong, this.type, this.totallead, this.isTrending, this.earned, this.status, this.isCompleted, this.brand, this.payoutamt, this.payoutcurrency, this.ctaAction, this.customdata});

  TaskModel.fromJson(Map<String, dynamic> json) {
    taskId = json['taskId'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    shortDesc = json['shortDesc'];
    payout = json['payout'];
    ctaShort = json['ctaShort'];
    ctaLong = json['ctaLong'];
    type = json['type'];
    totallead = json['total_lead'];
    isTrending = json['isTrending'];
    earned = json['earned'];
    status = json['status'];
    isCompleted = json['isCompleted'];
    brand = json['brand'] != null ? Brand?.fromJson(json['brand']) : null;
    payoutamt = json['payout_amt'];
    payoutcurrency = json['payout_currency'];
    ctaAction = json['ctaAction'];
    customdata = json['custom_data'] != null ? CustomData?.fromJson(json['custom_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['taskId'] = taskId;
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    data['shortDesc'] = shortDesc;
    data['payout'] = payout;
    data['ctaShort'] = ctaShort;
    data['ctaLong'] = ctaLong;
    data['type'] = type;
    data['total_lead'] = totallead;
    data['isTrending'] = isTrending;
    data['earned'] = earned;
    data['status'] = status;
    data['isCompleted'] = isCompleted;
    data['brand'] = brand!.toJson();
    data['payout_amt'] = payoutamt;
    data['payout_currency'] = payoutcurrency;
    data['ctaAction'] = ctaAction;
    data['custom_data'] = customdata!.toJson();
    return data;
  }
}

