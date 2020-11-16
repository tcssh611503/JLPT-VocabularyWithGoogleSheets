// DataList is a data class which stores data fields of Feedback.
class DataList {
  String kannji;
  String gojuuon;
  String imi;
  String sentence;

  DataList(this.kannji, this.gojuuon, this.imi, this.sentence);

  factory DataList.fromJson(dynamic json) {
    return DataList(
        "${json['kannji']}",
        "${json['gojuuon']}",
        "${json['imi']}",
        "${json['sentence']}"
    );
  }

  // Method to make GET parameters.
  Map toJson() => {
        'kannji': kannji,
        'gojuuon': gojuuon,
        'imi': imi,
        'sentence': sentence
      };
}


class Data {
  String kannji;
  String gojuuon;
  String imi;
  String sentence;

  Data(this.kannji, this.gojuuon, this.imi, this.sentence);

  
}