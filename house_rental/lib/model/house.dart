class House{
  String name;
  String address;
  String imageUrl;

  House(this.name,this.address,this.imageUrl);

  static List<House> generateRecommended(){
    return [
      House('The moon House','P455,Parcelles','assets/images/house01.jpeg'),
      House('The moon House','P455,Parcelles','assets/images/house02.jpeg'),
      House('The moon House','P455,Parcelles','assets/images/house01.jpeg'),
     
    ];
  }

  static List<House> generateBestOffers(){
    return [
      House('The moon House','P455,Parcelles','assets/images/offer01.jpeg'),
      House('The moon House','P455,Parcelles','assets/images/offer02.jpeg'),
      House('The moon House','P455,Parcelles','assets/images/offer01.jpeg'),
     
    ];
  }
}