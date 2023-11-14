class SuperModel {
  String? id;
  final String? hostName;
  final String? money;
  final String? name;
  final String? address;
  final String? rating;
  bool? isFavourite;
  final String? type;
  final String? image;
  final String? owner;

  final String? extented;
  final bool isDeal;
  final bool topHost;

  SuperModel({
    this.id = "0",
    this.hostName,
    this.money,
    this.name,
    this.address,
    this.rating,
    this.isFavourite,
    this.type,
    this.image,
    this.owner,
    this.extented,
    this.isDeal = false,
    this.topHost = false,
  });

  static List<SuperModel> getCars() {
    List<SuperModel> superModels = [];

    for (int i = 0; i < 100; i++) {
      SuperModel superModel = SuperModel(
        id: i.toString(),
        topHost: i % 2 == 0 ? true : false,
        hostName: "Host Name $i",
        money: "2005",
        name: "JAGUAR XF",
        address: "Oregon",
        rating: "2.5",
        isFavourite: i % 2 == 0 ? true : false,
        type: "CAR",
        image:
            "https://imageio.forbes.com/specials-images/imageserve/6064c6802c761b99a89d1f21/0x0.jpg?format=jpg&crop=2375,1336,x0,y120,safe&width=1200",
        owner: "Eduardo",
        extented: "Hour",
        isDeal: i % 2 == 0 ? true : false,
      );

      superModels.add(superModel);
    }

    return superModels;
  }

  static List<SuperModel> getStay() {
    List<SuperModel> superModels = [];

    for (int i = 0; i < 100; i++) {
      SuperModel superModel = SuperModel(
          topHost: i % 2 == 0 ? true : false,
          isDeal: i % 2 == 0 ? true : false,
          hostName: "Host Name 1",
          money: "200",
          name: "Stay JAGUAR XF",
          address: "Oregon",
          rating: "2.5",
          isFavourite: i % 2 == 0 ? true : false,
          type: "STAY",
          image:
              "https://cf.bstatic.com/xdata/images/hotel/max1024x768/271619464.jpg?k=9b269183149ff60cf826037d01b57c1091d2be5ac2e0f091a76ab48eaee0f987&o=&hp=1",
          owner: "Miguel",
          extented: "Hour");

      superModels.add(superModel);
    }

    return superModels;
  }

  static List<SuperModel> getYacht() {
    List<SuperModel> superModels = [];

    for (int i = 0; i < 100; i++) {
      SuperModel superModel = SuperModel(
          isDeal: i % 2 == 0 ? true : false,
          hostName: "Host Name 1",
          money: "200",
          name: "Yacht JAGUAR XF",
          address: "Oregon",
          rating: "2.5",
          topHost: i % 2 == 0 ? true : false,
          isFavourite: i % 2 == 0 ? true : false,
          type: "YACHT",
          image:
              "https://static4.depositphotos.com/1000129/313/i/950/depositphotos_3139714-stock-photo-motor-yatch.jpg",
          owner: "Chrome",
          extented: "Day");

      superModels.add(superModel);
    }

    return superModels;
  }

  static List<SuperModel> getBoat() {
    List<SuperModel> superModels = [];

    for (int i = 0; i < 100; i++) {
      SuperModel superModel = SuperModel(
          isDeal: i % 2 == 0 ? true : false,
          topHost:  i % 2 == 0 ? true : false,
          hostName: "Host Name 1",
          money: "200",
          name: "Boat JAGUAR XF",
          address: "Oregon",
          rating: "2.5",
          isFavourite: i % 2 == 0 ? true : false,
          type: "BOAT",
          image:
              "https://media.gettyimages.com/id/153642886/es/foto/alegre-joven-montando-en-un-bote.jpg?s=612x612&w=gi&k=20&c=y4eBMQQokoc1euCgwfqWsXM5QhODmdAWVoKopWuQYTE=",
          owner: "Feid",
          extented: "Day");

      superModels.add(superModel);
    }

    return superModels;
  }
}
