import 'package:cthtc/global/services/graphql.dart';
import 'package:cthtc/models/property.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class PropertyRepo {
  PropertyRepo._();
  static final PropertyRepo instance = PropertyRepo._();

  Future<List<Property>> fetchProperties() async {
    // return QueryResult from Future<>
    final QueryResult result = await GraphQlService.performQuery(
      document: FETCH_WALLS,
    );
    final properties = result.data?['listProperties']['items'];
    // print(properties);
    // Assign model
    if (properties.isNotEmpty) {
      return (properties as List)
          .map((property) => Property.fromMap(property))
          .toList();
    }
    return [];
  }

  static const String FETCH_WALLS = '''
    query ListProperties{
      listProperties {
        items {
          id
          title
          price
          isUrgent
          type
          status
        }
      }
    }
    ''';
}
