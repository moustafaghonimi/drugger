class CommentModel {
  String? message;
  Comment? comment;

  CommentModel({
    this.message,
    this.comment,
  });

  CommentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    comment = (json['comment'] as Map<String,dynamic>?) != null ? Comment.fromJson(json['comment'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['message'] = message;
    json['comment'] = comment?.toJson();
    return json;
  }
}

class Comment {
  String? createdBy;
  String? medicineId;
  String? commentDesc;
  List<dynamic>? like;
  List<dynamic>? unlike;
  List<dynamic>? reply;
  bool? isDeleted;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Comment({
    this.createdBy,
    this.medicineId,
    this.commentDesc,
    this.like,
    this.unlike,
    this.reply,
    this.isDeleted,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Comment.fromJson(Map<String, dynamic> json) {
    createdBy = json['createdBy'] as String?;
    medicineId = json['medicineId'] as String?;
    commentDesc = json['commentDesc'] as String?;
    like = json['like'] as List?;
    unlike = json['unlike'] as List?;
    reply = json['reply'] as List?;
    isDeleted = json['isDeleted'] as bool?;
    id = json['_id'] as String?;
    createdAt = json['createdAt'] as String?;
    updatedAt = json['updatedAt'] as String?;
    v = json['__v'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['createdBy'] = createdBy;
    json['medicineId'] = medicineId;
    json['commentDesc'] = commentDesc;
    json['like'] = like;
    json['unlike'] = unlike;
    json['reply'] = reply;
    json['isDeleted'] = isDeleted;
    json['_id'] = id;
    json['createdAt'] = createdAt;
    json['updatedAt'] = updatedAt;
    json['__v'] = v;
    return json;
  }
}