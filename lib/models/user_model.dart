class CurrentUser {
  final String name;
  final String imageUrl;

  CurrentUser(this.name, this.imageUrl);
}

class CurrentUserData {
  static final CurrentUser userData = CurrentUser("Himanshu",
      "https://images.unsplash.com/photo-1602471615287-d733c59b79c4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80");
}

class User {
  final String userProfileImageUrl;
  final bool isStory;
  final bool isSeen;

  User(this.userProfileImageUrl, this.isStory, this.isSeen);
}
