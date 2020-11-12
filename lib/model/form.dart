/// FeedbackForm is a data class which stores data fields of Feedback.
class FeedbackForm {
  String kannji;
  String gojuuon;
  String imi;
  String sentence;

  FeedbackForm(this.kannji, this.gojuuon, this.imi, this.sentence);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm(
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
