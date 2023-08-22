import 'package:brokr/models/crew_member_model.dart';
import 'package:brokr/models/policy_model.dart';
import 'package:brokr/models/review_model.dart';

import 'amenities_model.dart';
import 'characteristics_model.dart';

enum TypeAsset { car, yacht, boat, stay }

class ListingModel {
  final String id;
  final TypeAsset typeAsset;
  final String title;
  final String owner;
  final String address;
  final String description;
  final List<String> image;
  final Map<String, bool> allowed;
  final List<AmenitiesModel> amenities;
  final List<CharacteristicsModel> characteristics;
  final double rating;
  final List<ReviewModel> reviews;
  final double timeUnit;
  final double lateFee;
  final bool isPromo;
  final double promoPercent;
  final double publicPrice;
  final double wholesalePrice;
  final PolicyModel policy;
  final List<CrewMember> crews;

  ListingModel(
      {required this.id,
      required this.typeAsset,
      required this.title,
      required this.owner,
      required this.address,
      required this.description,
      required this.image,
      required this.allowed,
      required this.amenities,
      required this.characteristics,
      required this.rating,
      required this.reviews,
      required this.timeUnit,
      required this.lateFee,
      required this.isPromo,
      required this.promoPercent,
      required this.publicPrice,
      required this.wholesalePrice,
      required this.policy,
      required this.crews});
}
