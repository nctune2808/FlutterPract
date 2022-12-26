import 'package:bloc/bloc.dart';
import 'package:cthtc/global/states/status.dart';
import 'package:cthtc/models/property.dart';
import 'package:cthtc/src/property/property_repo.dart';

part 'property_event.dart';
part 'property_state.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  PropertyRepo _propertyRepo = PropertyRepo.instance;
  PropertyBloc() : super(Init_PropertyState());

  Stream<PropertyState> mapFetchEventToState() async* {
    // List<Property?>? properties = await _propertyRepo.queryListItems();
    yield state.copyWith(status: StatusSucess(), properties: [
      Property(
          id: '123',
          title: '123',
          price: 123,
          isUrgent: true,
          type: PropertyType.ACCOMMODATION,
          status: PropertyStatus.LET)
    ]);
  }

  @override
  Stream<PropertyState> mapEventToState(PropertyEvent event) async* {
    if (event is Fetch_PropertyEvent) {
      yield* mapFetchEventToState();
    }
  }
}
