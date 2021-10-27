import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tolo/auth/session/session_bloc.dart';
import 'package:tolo/src/home/loading_view.dart';
import 'package:tolo/src/profile/profile_bloc.dart';
import 'package:tolo/utility/state/status.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F7),
      appBar: AppBar(title: Text('Profile')),
      body: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) {
          print("--ProfileSession:-- ${state.status}");
          if (state.status is StatusAuthenticated) {
            return _profileBuilder();
          }
          return LoadingView();
        },
      ),
    );
  }

  Widget _profileBuilder() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              _avatar(),
              _changeAvatarButton(),
              SizedBox(height: 30),
              _usernameTile(),
              _emailTile(),
              // _descriptionTile(),
              // _saveProfileChangesButton(),
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
        // backgroundImage: FileImage(File(state.avatarPath!)),
      );
    });
  }

  Widget _changeAvatarButton() {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.isImagePickerVisible) {
          _showImageSourceActionSheet();
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        return TextButton(
          onPressed: () =>
              context.read<ProfileBloc>().add(UpAvatarProfileEvent()),
          child: Text('Change Avatar'),
        );
      }),
    );
  }

  Widget _usernameTile() {
    return BlocBuilder<SessionBloc, SessionState>(builder: (context, state) {
      return ListTile(
        tileColor: Colors.white,
        leading: Icon(Icons.person),
        title: Text(state.user != null ? state.user!.username! : "null"),
      );
    });
  }

  Widget _emailTile() {
    return BlocBuilder<SessionBloc, SessionState>(builder: (context, state) {
      return ListTile(
        tileColor: Colors.white,
        leading: Icon(Icons.mail),
        title: Text(state.user != null ? state.user!.email! : "null"),
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

  // Widget _saveProfileChangesButton() {
  //   return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
  //     return ElevatedButton(
  //       onPressed: () {},
  //       child: Text('Save Changes'),
  //     );
  //   });
  // }

  void _showImageSourceActionSheet() {
    Function(ImageSource) selectImageSource = (imageSource) {
      context
          .read<ProfileBloc>()
          .add(ImgPickerProfileEvent(imageSource: imageSource));
    };

    if (Platform.isIOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  selectImageSource(ImageSource.camera);
                },
                child: Text("Camera")),
            CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  selectImageSource(ImageSource.gallery);
                },
                child: Text("Photos")),
          ],
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) => Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt_rounded),
              title: Text("Camera"),
              onTap: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_rounded),
              title: Text("Photos"),
              onTap: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.gallery);
              },
            ),
          ],
        ),
      );
    }
  }
}
