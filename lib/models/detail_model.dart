class Root {
  String? eventId;
  String? title;
  String? description;
  String? payout;
  bool? isCompleted;
  int? payoutamt;
  String? payoutcurrency;

  Root({this.eventId, this.title, this.description, this.payout, this.isCompleted, this.payoutamt, this.payoutcurrency});

  Root.fromJson(Map<String, dynamic> json) {
    eventId = json['eventId'];
    title = json['title'];
    description = json['description'];
    payout = json['payout'];
    isCompleted = json['isCompleted'];
    payoutamt = json['payout_amt'];
    payoutcurrency = json['payout_currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['eventId'] = eventId;
    data['title'] = title;
    data['description'] = description;
    data['payout'] = payout;
    data['isCompleted'] = isCompleted;
    data['payout_amt'] = payoutamt;
    data['payout_currency'] = payoutcurrency;
    return data;
  }
}

