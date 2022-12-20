import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:cthtc/models/Property.dart';

class PropertyRepo {
  PropertyRepo._();
  static final PropertyRepo instance = PropertyRepo._();

  Future<List<Property?>?> queryListItems() async {
    try {
      final request = ModelQueries.list(Property.classType);
      final response = await Amplify.API.query(request: request).response;

      final properties = response.data?.items;
      if (properties == null) {
        print('errors: ${response.errors}');
        return <Property>[];
      }
      return properties;
    } on ApiException catch (e) {
      print('Query failed: $e');
    }
    return <Property>[];
  }
}
