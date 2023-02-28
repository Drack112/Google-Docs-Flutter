import 'dart:convert';

import 'package:docs_google/constants.dart';
import 'package:docs_google/models/document_model.dart';
import 'package:docs_google/models/error_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

final documentRepository = Provider(
  (ref) => DocumentRepository(
    client: Client(),
  ),
);

class DocumentRepository {
  final Client _client;

  DocumentRepository({
    required Client client,
  }) : _client = client;

  Future<ErrorModel> createDocument(String token) async {
    ErrorModel error = ErrorModel(
      error: "Some unexpected error ocurred.",
      data: null,
    );

    try {
      var res = await _client.post(
        Uri.parse(
          '$host/doc/create',
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer: $token',
        },
        body: jsonEncode(
          {
            'createdAt': DateTime.now().millisecondsSinceEpoch,
          },
        ),
      );

      switch (res.statusCode) {
        case 201:
          error = ErrorModel(
            error: null,
            data: DocumentModel.fromJson(
              res.body,
            ),
          );
          break;
        default:
          error = ErrorModel(
            error: null,
            data: null,
          );
          break;
      }
    } catch (e) {
      error = ErrorModel(
        error: e.toString(),
        data: null,
      );
    }
    return error;
  }
}
