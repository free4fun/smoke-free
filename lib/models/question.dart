// To parse this JSON data, do
//
//     final questionResponse = questionResponseFromMap(jsonString);

import 'dart:convert';

QuestionResponse questionResponseFromMap(String str) =>
    QuestionResponse.fromMap(json.decode(str));

String questionResponseToMap(QuestionResponse data) =>
    json.encode(data.toMap());

class QuestionResponse {
  QuestionResponse({
    required this.preguntas,
  });

  final List<Question> preguntas;

  factory QuestionResponse.fromMap(Map<String, dynamic> json) =>
      QuestionResponse(
        preguntas: List<Question>.from(
            json["preguntas"].map((x) => Question.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "preguntas": List<dynamic>.from(preguntas.map((x) => x.toMap())),
      };
}

class Question {
  Question({
    required this.orden,
    required this.textPregunta,
    required this.respuestas,
    required this.respuestaCorrectaId,
  });

  final int orden;
  final String textPregunta;
  final List<Answer> respuestas;
  final int respuestaCorrectaId;

  factory Question.fromMap(Map<String, dynamic> json) => Question(
        orden: json["orden"],
        textPregunta: json["textPregunta"],
        respuestas:
            List<Answer>.from(json["respuestas"].map((x) => Answer.fromMap(x))),
        respuestaCorrectaId: json["respuestaCorrectaId"],
      );

  Map<String, dynamic> toMap() => {
        "orden": orden,
        "textPregunta": textPregunta,
        "respuestas": List<dynamic>.from(respuestas.map((x) => x.toMap())),
        "respuestaCorrectaId": respuestaCorrectaId,
      };
}

class Answer {
  Answer({
    required this.respuestaId,
    required this.respuestaTexto,
  });

  final int respuestaId;
  final String respuestaTexto;

  factory Answer.fromMap(Map<String, dynamic> json) => Answer(
        respuestaId: json["respuestaId"],
        respuestaTexto: json["respuestaTexto"],
      );

  Map<String, dynamic> toMap() => {
        "respuestaId": respuestaId,
        "respuestaTexto": respuestaTexto,
      };
}
