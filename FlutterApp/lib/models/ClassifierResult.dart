// To parse this JSON data, do
//
//     final predicition = predicitionFromJson(jsonString);

import 'dart:convert';

Predicition predicitionFromJson(String str) => Predicition.fromJson(json.decode(str));

String predicitionToJson(Predicition data) => json.encode(data.toJson());

class Predicition {
    String predicitionClass;
    String classDesc;
    int confidence;

    Predicition({
        this.predicitionClass,
        this.classDesc,
        this.confidence,
    });

    factory Predicition.fromJson(Map<String, dynamic> json) => Predicition(
        predicitionClass: json["class"],
        classDesc: json["class_desc"],
        confidence: json["confidence"],
    );

    Map<String, dynamic> toJson() => {
        "class": predicitionClass,
        "class_desc": classDesc,
        "confidence": confidence,
    };
}