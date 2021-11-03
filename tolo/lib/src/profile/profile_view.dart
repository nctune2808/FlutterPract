import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tolo/auth/session/session_bloc.dart';
import 'package:tolo/model/user.dart';
import 'package:tolo/src/home/loading_view.dart';
import 'package:tolo/src/profile/profile_bloc.dart';
import 'package:tolo/utility/state/status.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F7),
      appBar: AppBar(title: Text('Profile')),
      body: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) {
          print("--ProfileSession:-- ${state.status}");
          return BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, pState) {
              pState.user = state.user;

              if (state.status is StatusAuthenticated) {
                if (pState.status is StatusInitial) {
                  context
                      .read<ProfileBloc>()
                      .add(FetchAvatarProfileEvent(user: pState.user!));
                } else if (pState.status is StatusSucess) {
                  return _sceneBuilder(user: pState.user!);
                }
              }

              return LoadingView();
            },
          );
        },
      ),
    );
  }

  Widget _sceneBuilder({required User user}) {
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
              _saveProfile(),
            ],
          ),
        ),
      );
    });
  }

  Widget _avatar() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, pState) {
        if (pState.photo!.url != null && pState.avatarPath == null) {
          return CircleAvatar(
              radius: 80, backgroundImage: NetworkImage(pState.photo!.url!));
        } else {
          if (pState.avatarPath != null)
            return CircleAvatar(
                radius: 80,
                backgroundImage: FileImage(File(pState.avatarPath!)));
          else
            return Icon(Icons.person, size: 50);
        }
      },
    );
  }

  Widget _changeAvatarButton() {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.isImagePickerVisible) {
          _showImageSourceActionSheet();
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, pState) {
        return TextButton(
          onPressed: () =>
              context.read<ProfileBloc>().add(UpAvatarProfileEvent()),
          child: Text('Change Avatar'),
        );
      }),
    );
  }

  Widget _usernameTile() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return ListTile(
        tileColor: Colors.white,
        leading: Icon(Icons.person),
        title: Text(state.user != null ? state.user!.username! : "null"),
      );
    });
  }

  Widget _emailTile() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
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

  Widget _saveProfile() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, pState) {
      return ElevatedButton(
        onPressed: () {
          context.read<ProfileBloc>().add(SaveProfileEvent(user: pState.user!));
        },
        child: Text('Save Changes'),
      );
    });
  }

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
                onPressed: () async {
                  Navigator.pop(context);
                  await selectImageSource(ImageSource.camera);
                },
                child: Text("Camera")),
            CupertinoActionSheetAction(
                onPressed: () async {
                  Navigator.pop(context);
                  await selectImageSource(ImageSource.gallery);
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
              onTap: () async {
                Navigator.pop(context);
                await selectImageSource(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_rounded),
              title: Text("Photos"),
              onTap: () async {
                Navigator.pop(context);
                await selectImageSource(ImageSource.gallery);
              },
            ),
          ],
        ),
      );
    }
  }
}
