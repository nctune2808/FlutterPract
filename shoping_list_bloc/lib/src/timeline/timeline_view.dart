// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shoping_list_bloc/src/timeline/post/post_view.dart';
import 'package:shoping_list_bloc/src/timeline/timeline_bloc.dart';
import 'package:shoping_list_bloc/src/timeline/timeline_repository.dart';

class TimelineView extends StatefulWidget {
  const TimelineView({Key? key}) : super(key: key);

  @override
  _TimelineViewState createState() => _TimelineViewState();
}

class _TimelineViewState extends State<TimelineView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timeline")),
      body: BlocBuilder<TimelineBloc, TimelineState>(
        builder: (context, state) {
          if (state is TimelineStateSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<TimelineBloc>()..add(PullToRefreshEvent());
                // return Future.delayed(Duration(seconds: 1), () {
                //   setState(() {

                //   });
                // });
              },
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostView(post: state.posts[index]);
                },
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
    //   },
    // );
  }
}
