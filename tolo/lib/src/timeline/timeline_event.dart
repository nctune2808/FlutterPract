part of 'timeline_bloc.dart';

abstract class TimelineEvent {}

class FetchTimelineEvent extends TimelineEvent {}

class StreamTimelineEvent extends TimelineEvent {}

class RefreshTimelineEvent extends TimelineEvent {}
