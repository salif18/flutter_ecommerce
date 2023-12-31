class Products {
  dynamic productId;
  String name;
  String image;
  List<String> galerie;
  String descriptions; 
  String category;
  String objets; 
  String mode;
  double prix;
  int notes;
 

  Products(this.productId, this.name, this.image, this.galerie,
      this.descriptions, this.category, this.objets, this.mode,this.prix, this.notes);

  static List<Products> getProducts() {
    return [
      Products(
          1,
          "Sac",
          "assets/images/sac1.png",
          [],
          "Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.",
          "Femme",
          "Accessoires",
          "news",
          9000,
          5),
      Products(
          3,
          "Casque",
          "assets/images/casque.png",
          [],
          "Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.",
          "homme",
          "Accessoires",
          "news",
          15000,
          5),
      Products(
          4,
          "Watch",
          "assets/images/watch.png",
          [],
          "Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.",
          "Femme",
          "Accessoires",
          "news",
          30000,
          5),
      Products(
          5,
          "Tv smart",
          "assets/images/tele.png",
          [],         
          "Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.",
          "materiel",
          "Accessoires",
          "news",
          230000,
          5),
      Products(
          6,
          "Nike",
          "assets/images/nike.png",
          [],
          "Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.",
          "Femme",
          "Accessoires",
          "news",
          22000,
          5),
      Products(
          7,
          "Nike o",
          "assets/images/nike2.png",
          [],
          "Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.",
          "Femme",
          "Accessoires",
          "populaire",
          6000,
          5),
      Products(
          8,
          "robe",
          "assets/images/robe.png",
          [],
          "Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.",
          "Femme",
          "Accessoires",
          "populaire",
          10000,
          5),
      Products(
          9,
          "Gaziniere",
          "assets/images/gazinier.png",
          [],
          "Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.",
          "materiel",
          "Accessoires",
          "populaire",
          40000,
          5),
      Products(
          10,
          "Chemise",
          "assets/images/chemise.png",
          [],
          "Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.",
          "Femme",
          "Accessoires",
          "populaire",
          9000,
          5),
      Products(
          2,
          "Sac Lui",
          "assets/images/sac2.png",
          [],
          "Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.",
          "Femme",
          "Accessoires",
          "populaire",
          8000,
          5),
          Products(
          11,
          "Nike kepi",
          "assets/images/snackbak.png",
          [],
          "Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.",
           "Femme",
          "Accessoires",
          "populaire",
          4000,
          9),
    ];
  }
}
