class StudentModels {
  String? sName;
  String? sProfile;
  int? sAge;
  String? sPhoto;

  StudentModels({
    required this.sName,
    required this.sProfile,
    required this.sAge,
    required this.sPhoto,
  });

  factory StudentModels.fromJSON(Map<String, dynamic> json) => StudentModels(
        sName: json["name"],
        sProfile: json["profile"],
        sAge: json["age"],
        sPhoto: json["photo"],
      );

  Map<String, dynamic> toJSON() => {
        "name": sName,
        "profile": sProfile,
        "age": sAge,
        "photo": sPhoto,
      };
}
