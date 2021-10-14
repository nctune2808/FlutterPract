part of 'timeline_bloc.dart';

class TimelineEvent {}

class LoadingTimelineEvent extends TimelineEvent {}

class PullToRefreshEvent extends TimelineEvent {}

class AddTimelineEvent extends TimelineEvent {
  Post post;
  AddTimelineEvent({
    required this.post,
  });
}

class DeleteTimelineEvent extends TimelineEvent {
  Post post;
  DeleteTimelineEvent({
    required this.post,
  });
}
