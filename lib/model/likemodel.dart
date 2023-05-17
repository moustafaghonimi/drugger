import 'commentModel.dart';

/// message : "Done"
/// comment : {"_id":"64623808c1de3548fb75280f","createdBy":"646170088579da5ccb7a7165","medicineId":"64487b857e32e628eefab3e7","commentDesc":"الحمد لله لوحدي حمله ابعد عني عشان غشيم","like":["646170088579da5ccb7a7165","64551482dc5efc828bc2e0f0"],"unlike":[],"reply":[],"isDeleted":false,"createdAt":"2023-05-15T13:47:52.570Z","updatedAt":"2023-05-16T10:48:14.051Z","__v":0}

class Likemodel {
  Likemodel({
      this.message, 
      this.comment,});

  Likemodel.fromJson(dynamic json) {
    message = json['message'];
    comment = json['comment'] != null ? Comment.fromJson(json['comment']) : null;
  }
  String? message;
  Comment? comment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (comment != null) {
      map['comment'] = comment?.toJson();
    }
    return map;
  }

}

/// _id : "64623808c1de3548fb75280f"
/// createdBy : "646170088579da5ccb7a7165"
/// medicineId : "64487b857e32e628eefab3e7"
/// commentDesc : "الحمد لله لوحدي حمله ابعد عني عشان غشيم"
/// like : ["646170088579da5ccb7a7165","64551482dc5efc828bc2e0f0"]
/// unlike : []
/// reply : []
/// isDeleted : false
/// createdAt : "2023-05-15T13:47:52.570Z"
/// updatedAt : "2023-05-16T10:48:14.051Z"
/// __v : 0

// class Comment {
//   Comment({
//       this.id,
//       this.createdBy,
//       this.medicineId,
//       this.commentDesc,
//       this.like,
//       this.unlike,
//       this.reply,
//       this.isDeleted,
//       this.createdAt,
//       this.updatedAt,
//       this.v,});
//
//   Comment.fromJson(dynamic json) {
//     id = json['_id'];
//     createdBy = json['createdBy'];
//     medicineId = json['medicineId'];
//     commentDesc = json['commentDesc'];
//     like = json['like'] != null ? json['like'].cast<String>() : [];
//     if (json['unlike'] != null) {
//       unlike = [];
//       json['unlike'].forEach((v) {
//         unlike?.add(Dynamic.fromJson(v));
//       });
//     }
//     if (json['reply'] != null) {
//       reply = [];
//       json['reply'].forEach((v) {
//         reply?.add(Dynamic.fromJson(v));
//       });
//     }
//     isDeleted = json['isDeleted'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     v = json['__v'];
//   }
//   String? id;
//   String? createdBy;
//   String? medicineId;
//   String? commentDesc;
//   List<String>? like;
//   List<dynamic>? unlike;
//   List<dynamic>? reply;
//   bool? isDeleted;
//   String? createdAt;
//   String? updatedAt;
//   num? v;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['_id'] = id;
//     map['createdBy'] = createdBy;
//     map['medicineId'] = medicineId;
//     map['commentDesc'] = commentDesc;
//     map['like'] = like;
//     if (unlike != null) {
//       map['unlike'] = unlike?.map((v) => v.toJson()).toList();
//     }
//     if (reply != null) {
//       map['reply'] = reply?.map((v) => v.toJson()).toList();
//     }
//     map['isDeleted'] = isDeleted;
//     map['createdAt'] = createdAt;
//     map['updatedAt'] = updatedAt;
//     map['__v'] = v;
//     return map;
//   }
//
// }