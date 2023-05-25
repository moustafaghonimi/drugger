class ResetProfileRequest {
  ResetProfileRequest({
      this.oldPassword, 
      this.newPassword,});

  ResetProfileRequest.fromJson(dynamic json) {
    oldPassword = json['oldPassword'];
    newPassword = json['newPassword'];
  }
  String? oldPassword;
  String? newPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['oldPassword'] = oldPassword;
    map['newPassword'] = newPassword;
    return map;
  }

}