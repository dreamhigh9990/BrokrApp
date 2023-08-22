enum TypeCrewMember { admin, captain, staff }

class CrewMember {
  final String name;
  final int trips;
  final double rating;
  final String date;
  final String image;
  // final TypeCrewMember;

  const CrewMember(this.name, this.trips, this.rating, this.date, this.image);
}
