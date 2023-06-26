abstract class AddPostStates {}

class AddPostInitialState extends AddPostStates {}

class AddPostLoadingState extends AddPostStates {}

class AddPostSuccessfullyState extends AddPostStates {}

class AddPostErrorState extends AddPostStates {}

class PostImagePickedSuccessState extends AddPostStates {}

class PostImagePickedErrorState extends AddPostStates {}

class UploadProfileImageSuccessState extends AddPostStates {}

class UploadProfileImageErrorState extends AddPostStates {}

class UploadCoverImageSuccessState extends AddPostStates {}

class UploadCoverImageErrorState extends AddPostStates {}

class UploadUserErrorState extends AddPostStates {}

class UploadUserLoadingState extends AddPostStates {}

class CreatePostLoadingState extends AddPostStates {}

class CreatePostSuccessState extends AddPostStates {}

class CreatePostErrorState extends AddPostStates {}

class RemovePostImageState extends AddPostStates {}

class GetPostsSuccessState extends AddPostStates {}

class GetPostsLoadingState extends AddPostStates {}

class GetPostsErrorState extends AddPostStates {
  final String error;
  GetPostsErrorState({
    required this.error,
  });
}

class LikePostSuccessState extends AddPostStates {}

class LikePostErrorState extends AddPostStates {
  final String error;
  LikePostErrorState({
    required this.error,
  });
}

