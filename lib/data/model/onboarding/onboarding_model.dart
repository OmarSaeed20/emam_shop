import 'package:ecommerce/index.dart';

class OnBoardingModel extends Equatable {
  final String title;
  final String image;
  final String supTitle;

  const OnBoardingModel({
    required this.title,
    required this.image,
    required this.supTitle,
  });

  @override
  List<Object?> get props => [title, image, supTitle];
}
