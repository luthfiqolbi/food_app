part of 'models.dart';

enum FoodType { newFood, popularFood, recommended }

class Food extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? ingredient;
  final String? picturePath;
  final double? price;
  final double? rate;
  final List<FoodType>? types;

  Food({
    this.id,
    this.name,
    this.description,
    this.ingredient,
    this.picturePath,
    this.price,
    this.rate,
    this.types = const [],
  });

  factory Food.fromJson(Map<String, dynamic> data) => Food(
        id: data['id'],
        name: data['name'],
        description: data['description'],
        ingredient: data['ingredients'],
        picturePath: data['picturePath'],
        price: data['price'].toDouble(),
        rate: data['rate'].toDouble(),
        types: data['types'].toString().split(',').map((e) {
          switch (e) {
            case 'new_food':
              return FoodType.newFood;
            case 'popular':
              return FoodType.popularFood;
            case 'recommended':
              return FoodType.recommended;
            default:
              return FoodType.newFood;
          }
        }).toList(),
      );

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        ingredient,
        picturePath,
        price,
        rate,
      ];
}

List<Food> mockFoods = [
  Food(
    id: 1,
    picturePath:
        'https://i.pinimg.com/236x/5b/f2/7e/5bf27e721ed7bc858e0a7f0d905632e8.jpg',
    name: 'Sate Sayur Sultan',
    description:
        'Sate Sayur Sultan adalah menu sate vegan paling terkenal di Jakarta. Sate ini dibuat dari berbagai macam bahan berkualitas terbaik dan langsung dibuat oleh chef handal. Sate ini sangat sehat dan bergizi.',
    ingredient: "Sate, Sayur",
    price: 150000,
    rate: 4.2,
    types: const [FoodType.newFood, FoodType.popularFood],
  ),
  Food(
    id: 2,
    picturePath:
        'https://i.pinimg.com/236x/e4/c8/ac/e4c8ac48c71738d0493b6e824f0094ed.jpg',
    name: 'Nasi Goreng Kambing',
    description:
        'Nasi Goreng Kambing spesial dengan bumbu rempah rahasia yang kaya akan cita rasa. Cocok untuk Anda yang menggemari makanan gurih dan pedas.',
    ingredient: "Nasi, kambing, bumbu rempah rahasia",
    price: 25000,
    rate: 4.5,
    types: const [FoodType.newFood, FoodType.popularFood, FoodType.recommended],
  ),
  Food(
    id: 3,
    picturePath:
        'https://i.pinimg.com/236x/1a/b7/ee/1ab7ee51c29e366c9c47311773c09dde.jpg',
    name: 'Mie Ayam Jamur',
    description:
        'Mie Ayam Jamur dengan topping ayam yang empuk dan jamur yang segar, disajikan dengan kuah kaldu yang lezat.',
    ingredient: "Mie, ayam, jamur, kuah kaldu, topping ayam, topping jamur",
    price: 20000,
    rate: 4.7,
  ),
  Food(
    id: 4,
    picturePath:
        'https://i.pinimg.com/236x/80/a9/1a/80a91a42cea42a2dcda727a48847642c.jpg',
    name: 'Bakso Beranak',
    description:
        'Bakso Beranak dengan ukuran jumbo berisi bakso kecil di dalamnya. Sangat cocok untuk pecinta makanan berkuah.',
    ingredient: "Bakso, bakso kecil, bakso jumbo",
    price: 30000,
    rate: 4.3,
  ),
  Food(
    id: 5,
    picturePath:
        'https://i.pinimg.com/236x/20/80/e0/2080e0aeb6d1d9c91b990892dcbbb455.jpg',
    name: 'Ayam Bakar Taliwang',
    description:
        'Ayam Bakar khas Lombok dengan bumbu pedas dan gurih, disajikan dengan plecing kangkung dan sambal terasi.',
    ingredient: "Ayam, bumbu pedas, gurih, plecing kangkung, sambal terasi",
    price: 50000,
    rate: 4.8,
    types: const [FoodType.recommended, FoodType.popularFood],
  ),
  Food(
    id: 6,
    picturePath:
        'https://i.pinimg.com/236x/6f/b7/f9/6fb7f9d36a80ee104e5a417ec2287b15.jpg',
    name: 'Gado-Gado Jakarta',
    description:
        'Gado-Gado dengan sayuran segar, tahu, tempe, dan lontong, disiram saus kacang kental yang gurih.',
    ingredient: "Gado-Gado, tahu, tempe, lontong",
    price: 20000,
    rate: 4.6,
    types: const [FoodType.popularFood, FoodType.recommended],
  ),
  Food(
    id: 7,
    picturePath:
        'https://i.pinimg.com/236x/6e/35/3d/6e353dfdcef71ce2f3dfe363390cb6b4.jpg',
    name: 'Es Cendol Durian',
    description:
        'Minuman es cendol dengan topping buah durian yang manis dan creamy, cocok untuk menghilangkan dahaga.',
    ingredient: "Es cendol, buah durian",
    price: 25000,
    rate: 4.4,
    types: const [FoodType.recommended, FoodType.newFood],
  ),
];
