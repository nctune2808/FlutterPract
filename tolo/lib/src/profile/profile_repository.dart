class ProfileRepository {
  // Future<void> saveImages(File _images, DocumentReference ref) async {
  //   String imageURL = await uploadImage(_images);
  //   ref.update({
  //     "images": FieldValue.arrayUnion([imageURL])
  //   });
  // }

  // Future uploadImage(File file) async {

  //   StorageReference storageReference;

  //   try {
  //     final fileName = DateTime.now().toIso8601String();
  //     final storageReference =
  //         FirebaseStorage.instance.ref().child("images/$fileName");

  //     final StorageUploadTask uploadTask = storageReference.putFile(file);
  //     final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
  //     final String url = (await downloadUrl.ref.getDownloadURL());
  //     print("URL is $url");
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
