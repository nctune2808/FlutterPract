part of 'timeline_bloc.dart';

class TimelineEvent {}

class LoadingTimelineEvent extends TimelineEvent {}

class RefreshTimelineEvent extends TimelineEvent {}

class InitTimelineEvent extends TimelineEvent {}

// class AddTimelineEvent extends TimelineEvent {
//   Post post;
//   AddTimelineEvent({
//     required this.post,
//   });
// }

// class DeleteTimelineEvent extends TimelineEvent {
//   Post post;
//   DeleteTimelineEvent({
//     required this.post,
//   });
// }

// class UpdateTimelineEvent extends TimelineEvent {
//   Post post;
//   UpdateTimelineEvent({
//     required this.post,
//   });
// }
