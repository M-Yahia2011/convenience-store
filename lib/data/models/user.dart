class User {
  final String userID;
  final String userName;
  final String? userImage;
  final String userPhone;
  List<String>? favouriteItems ;

  User({

    required this.userID,
    required this.userName,
     this.userImage,
    required this.userPhone,
     this.favouriteItems ,
  }
  );
}
