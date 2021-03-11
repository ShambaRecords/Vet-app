import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:vet_app/domain/api/api_base.dart';

@injectable
class ApiBaseProvider implements ApiBase {
  @override
  get(String url, bool isDocument) {
    return isDocument
        ? FirebaseFirestore.instance.doc(url).snapshots()
        : FirebaseFirestore.instance.collection(url).snapshots();
  }

  @override
  Future post(String url, final data, bool isDocument) async {
    if (isDocument) {
      await FirebaseFirestore.instance.doc(url).set(data.toJson());
    } else {
      await FirebaseFirestore.instance.collection(url).add(data.toJson());
    }
  }

  @override
  Future update(String url, final data, bool isDocument) async {
    if (isDocument) {
      await FirebaseFirestore.instance.doc(url).update(data);
    } else {
      //TODO: Check this twice
      await FirebaseFirestore.instance.collection(url).add(data);
    }
  }

  @override
  delete(String url, bool isDocument) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  filterByDate(
      String url, bool isDocument, Timestamp startTime, Timestamp endTime) {
    return isDocument
        ? FirebaseFirestore.instance.doc(url).snapshots()
        : FirebaseFirestore.instance
            .collection(url)
            .where('datetime', isGreaterThan: startTime, isLessThan: endTime).snapshots();
  }
}
