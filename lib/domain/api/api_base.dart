import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ApiBase {
  /// Get document or collection stream
  get(String url, bool isDocument);
  /// Add a new document or collection
  Future post(String url, final dynamic data, bool isDocument);
  /// Update an existing document or collection
  Future update(String url, final data, bool isDocument);
  /// Delete an existing document or collection
  Future delete(String url, bool isDocument);
  /// Get document or collection filtered by date
  filterByDate(String url, bool isDocument, Timestamp startTime, Timestamp endTime);
}
