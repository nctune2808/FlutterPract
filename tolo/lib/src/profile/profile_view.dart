import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo/src/profile/profile_bloc.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F7),
      appBar: _appBar(),
      body: _profilePage(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('Profile'),
      actions: [
        // if (state.isCurrentUser)
      ],
    );
  }

  Widget _profilePage() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              _avatar(),
              // if (state.isCurrentUser) _changeAvatarButton(),
              SizedBox(height: 30),
              _usernameTile(),
              _emailTile(),
              // _descriptionTile(),
              // if (state.isCurrentUser) _saveProfileChangesButton(),
            ],
          ),
        ),
      );
    });
  }

  Widget _avatar() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return CircleAvatar(
        radius: 50,
        child: Icon(Icons.person),
      );
    });
  }

  Widget _changeAvatarButton() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return TextButton(
        onPressed: () {},
        child: Text('Change Avatar'),
      );
    });
  }

  Widget _usernameTile() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return ListTile(
        tileColor: Colors.white,
        leading: Icon(Icons.person),
        // title: Text(state.username),
      );
    });
  }

  Widget _emailTile() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return ListTile(
        tileColor: Colors.white,
        leading: Icon(Icons.mail),
        // title: Text(state.email),
      );
    });
  }

  // Widget _descriptionTile() {
  //   return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
  //     return ListTile(
  //       tileColor: Colors.white,
  //       leading: Icon(Icons.edit),
  //       title: TextFormField(
  //         initialValue: state.userDescription,
  //         decoration: InputDecoration.collapsed(
  //             hintText: state.isCurrentUser
  //                 ? 'Say something about yourself'
  //                 : 'This user hasn\'t updated their profile'),
  //         maxLines: null,
  //         readOnly: !state.isCurrentUser,
  //         toolbarOptions: ToolbarOptions(
  //           copy: state.isCurrentUser,
  //           cut: state.isCurrentUser,
  //           paste: state.isCurrentUser,
  //           selectAll: state.isCurrentUser,
  //         ),
  //         onChanged: (value) => context
  //             .read<ProfileBloc>()
  //             .add(ProfileDescriptionChanged(description: value)),
  //       ),
  //     );
  //   });
  // }

  Widget _saveProfileChangesButton() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return ElevatedButton(
        onPressed: () {},
        child: Text('Save Changes'),
      );
    });
  }
}
