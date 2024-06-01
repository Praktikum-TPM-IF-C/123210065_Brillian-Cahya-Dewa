class ItemCart{
  final String name;
  final String imageUrl;
  final double cardMarketPrice;
  int count;
  bool isSet;


  ItemCart({
    required this.name,
    required this.imageUrl,
    required this.cardMarketPrice,
    required this.count,
    required this.isSet
    }
  );
}

List<ItemCart> itemCart = [
  ItemCart(
    name : "Dark Magician",
    imageUrl : "https://images.ygoprodeck.com/images/cards/46986421.jpg",
    cardMarketPrice: 0.11,
    count : 1,
    isSet: false
  ),
  ItemCart(
    name : "Dark Magician Girl",
    imageUrl : "https://images.ygoprodeck.com/images/cards/38033121.jpg",
    cardMarketPrice: 0.03,
    count : 1,
    isSet: false
  ),
  ItemCart(
    name : "Monster Reborn",
    imageUrl : "https://images.ygoprodeck.com/images/cards/83764719.jpg",
    cardMarketPrice: 0.21,
    count : 1,
    isSet: false
  ),
  ItemCart(
    name : "Black Luster Soldier",
    imageUrl : "https://images.ygoprodeck.com/images/cards/5405694.jpg",
    cardMarketPrice: 0.02,
    count : 1,
    isSet: false
  ),
  ItemCart(
    name : "Pot of Greed",
    imageUrl : "https://images.ygoprodeck.com/images/cards/55144522.jpg",
    cardMarketPrice: 0.89,
    count : 1,
    isSet: false
  ),
  ItemCart(
    name : "Five-Headed Dragon",
    imageUrl : "https://images.ygoprodeck.com/images/cards/99267150.jpg",
    cardMarketPrice: 1.34,
    count : 1,
    isSet: false
  ),
  ItemCart(
    name : "Polymerization",
    imageUrl : "https://images.ygoprodeck.com/images/cards/24094653.jpg",
    cardMarketPrice: 0.11,
    count : 1,
    isSet: false
  ),
];