import '/index.dart';

class OnBoardingModel extends Equatable {
  final String title;
  final String image;
  final String supTitle;
   final String? texBtn ;

  const OnBoardingModel({
    required this.title,
    required this.image,
    required this.supTitle,
    this.texBtn,
  });

  @override
  List<Object?> get props => [title, image, supTitle, texBtn];
}
