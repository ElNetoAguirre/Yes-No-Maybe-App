import "package:yes_no_maybe_app/domain/entities/message.dart";

class YesNoMaybeModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoMaybeModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoMaybeModel.fromJsonMap(Map<String, dynamic> json) =>
    YesNoMaybeModel(
      answer: json["answer"],
      forced: json["forced"],
      image: json["image"],
    );

  Map<String, dynamic> toJson() => {
    "answer": answer,
    "forced": forced,
    "image": image,
  };

  Message toMessageEntity() => Message(
    text: answer == "yes" ? "Si" : (answer == "no" ? "No" : "Quizá..."),
    fromWho: FromWho.hers,
    imageUrl: image
  );
}
