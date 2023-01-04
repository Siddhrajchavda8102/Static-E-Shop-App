class VendorModel {
  final String image;
  final String name;
  final String brand;
  final double initialRating;
  final void Function(double)? onRatingUpdate; 

  VendorModel({
    required this.initialRating,
    required this.image,
    required this.name,
    required this.brand,
    this.onRatingUpdate
  });
}
