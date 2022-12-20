part of 'property_bloc.dart';

class PropertyState {
  final List<Property?>? properties;
  final Status? status;

  PropertyState({
    this.properties,
    this.status = const StatusInitial(),
  });

  PropertyState copyWith({
    List<Property?>? properties,
    Status? status,
  }) {
    return PropertyState(
      properties: properties ?? this.properties,
      status: status ?? this.status,
    );
  }
}

class Init_PropertyState extends PropertyState {}
