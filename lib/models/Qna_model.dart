class QnaModel {
  int? status;
  String? message;
  List<Data>? data;

  QnaModel({this.status, this.message, this.data});

  QnaModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? qnaId;
  String? questionTitle;
  String? questionDescription;
  String? questionImage;
  int? user;

  Data(
      {this.qnaId,
      this.questionTitle,
      this.questionDescription,
      this.questionImage,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    qnaId = json['qna_id'];
    questionTitle = json['question_title'];
    questionDescription = json['question_description'];
    questionImage = json['question_image'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qna_id'] = this.qnaId;
    data['question_title'] = this.questionTitle;
    data['question_description'] = this.questionDescription;
    data['question_image'] = this.questionImage;
    data['user'] = this.user;
    return data;
  }
}
