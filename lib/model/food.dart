part of 'models.dart';

class Food {
  final int? id;
  final String? name;
  final String? picturePath;
  final String? description;
  final double? price;
  final double? rate;

  Food({
    this.id,
    this.name,
    this.picturePath,
    this.description,
    this.price,
    this.rate,
});
}

List<Food> Foods = [
  Food(
    id: 1,
    picturePath: 'https://i.pinimg.com/236x/5b/f2/7e/5bf27e721ed7bc858e0a7f0d905632e8.jpg',
    name: 'Sate Sayur Sultan',
    description: 'Sate Sayur Sultan adalah menu sate vegan paling terkenal di Jakarta. Sate ini dibuat dari berbagai macam bahan berkualitas terbaik dan langsung dibuat oleh chef handal. Sate ini sangat sehat dan bergizi.',
    price: 150000,
    rate: 4.2,
  ),
  Food(
    id: 2,
    picturePath: 'https://i.pinimg.com/236x/e4/c8/ac/e4c8ac48c71738d0493b6e824f0094ed.jpg',
    name: 'Nasi Goreng Kambing',
    description: 'Nasi Goreng Kambing spesial dengan bumbu rempah rahasia yang kaya akan cita rasa. Cocok untuk Anda yang menggemari makanan gurih dan pedas.',
    price: 25000,
    rate: 4.5,
  ),
  Food(
    id: 3,
    picturePath: 'https://i.pinimg.com/236x/1a/b7/ee/1ab7ee51c29e366c9c47311773c09dde.jpg',
    name: 'Mie Ayam Jamur',
    description: 'Mie Ayam Jamur dengan topping ayam yang empuk dan jamur yang segar, disajikan dengan kuah kaldu yang lezat.',
    price: 20000,
    rate: 4.7,
  ),
  Food(
    id: 4,
    picturePath: 'https://i.pinimg.com/236x/80/a9/1a/80a91a42cea42a2dcda727a48847642c.jpg',
    name: 'Bakso Beranak',
    description: 'Bakso Beranak dengan ukuran jumbo berisi bakso kecil di dalamnya. Sangat cocok untuk pecinta makanan berkuah.',
    price: 30000,
    rate: 4.3,
  ),
  Food(
    id: 5,
    picturePath: 'https://i.pinimg.com/236x/20/80/e0/2080e0aeb6d1d9c91b990892dcbbb455.jpg',
    name: 'Ayam Bakar Taliwang',
    description: 'Ayam Bakar khas Lombok dengan bumbu pedas dan gurih, disajikan dengan plecing kangkung dan sambal terasi.',
    price: 50000,
    rate: 4.8,
  ),
  Food(
    id: 6,
    picturePath: 'https://i.pinimg.com/236x/6f/b7/f9/6fb7f9d36a80ee104e5a417ec2287b15.jpg',
    name: 'Gado-Gado Jakarta',
    description: 'Gado-Gado dengan sayuran segar, tahu, tempe, dan lontong, disiram saus kacang kental yang gurih.',
    price: 20000,
    rate: 4.6,
  ),
  Food(
    id: 7,
    picturePath: 'https://i.pinimg.com/236x/6e/35/3d/6e353dfdcef71ce2f3dfe363390cb6b4.jpg',
    name: 'Es Cendol Durian',
    description: 'Minuman es cendol dengan topping buah durian yang manis dan creamy, cocok untuk menghilangkan dahaga.',
    price: 25000,
    rate: 4.4,
  ),
  Food(
    id: 8,
    picturePath: 'https://i.pinimg.com/236x/6d/8d/3f/6d8d3fd5cc5ea81c90c8fdea252d53bc.jpg',
    name: 'Rendang Daging Padang',
    description: 'Rendang daging sapi khas Padang yang empuk dan berbumbu kuat, dimasak dengan santan kental.',
    price: 70000,
    rate: 4.9,
  ),
  Food(
    id: 9,
    picturePath: 'https://i.pinimg.com/236x/33/cc/71/33cc71a7a41d93389763f572cc9e3bf1.jpg',
    name: 'Pempek Palembang',
    description: 'Pempek Palembang dengan kuah cuko yang asam manis pedas, tersedia dalam berbagai varian: kapal selam, lenjer, adaan.',
    price: 35000,
    rate: 4.1,
  ),
  Food(
    id: 10,
    picturePath: 'https://i.pinimg.com/236x/97/bb/4e/97bb4eaf5f65c8c56a63c24bf8a11523.jpg',
    name: 'Martabak Manis Keju',
    description: 'Martabak manis dengan isian keju yang melimpah dan lezat, ditambah topping susu kental manis.',
    price: 45000,
    rate: 4.5,
  ),
  Food(
    id: 11,
    picturePath: 'https://i.pinimg.com/236x/04/0a/b7/040ab7ffcee1d68d4c9f90a00f2e7f70.jpg',
    name: 'Soto Betawi',
    description: 'Soto Betawi dengan kuah santan yang gurih dan potongan daging sapi serta jeroan.',
    price: 40000,
    rate: 4.3,
  ),
  Food(
    id: 12,
    picturePath: 'https://i.pinimg.com/236x/1b/8f/5c/1b8f5c51ed02e14bd312f8c62d7e9194.jpg',
    name: 'Bubur Ayam',
    description: 'Bubur ayam hangat dengan topping ayam suwir, cakwe, dan kacang kedelai goreng.',
    price: 15000,
    rate: 4.6,
  ),
  Food(
    id: 13,
    picturePath: 'https://i.pinimg.com/236x/5e/15/f4/5e15f480bb7fc7e1443c764fd14d06ef.jpg',
    name: 'Sate Padang',
    description: 'Sate Padang dengan bumbu kuah kental kuning khas, disajikan dengan lontong dan bawang goreng.',
    price: 30000,
    rate: 4.7,
  ),
  Food(
    id: 14,
    picturePath: 'https://i.pinimg.com/236x/4b/4c/b7/4b4cb71c52e4bbf9754f10cbbc7753af.jpg',
    name: 'Kwetiau Goreng Seafood',
    description: 'Kwetiau goreng dengan isian seafood segar seperti udang, cumi, dan bakso ikan, dengan bumbu khas.',
    price: 45000,
    rate: 4.4,
  ),
  Food(
    id: 15,
    picturePath: 'https://i.pinimg.com/236x/1f/df/2b/1fdf2b6f7181b918f1e8c9d2d3b8c57d.jpg',
    name: 'Gudeg Jogja',
    description: 'Gudeg khas Yogyakarta dengan nangka muda, telur, ayam, dan krecek, disajikan dengan nasi putih.',
    price: 30000,
    rate: 4.8,
  ),
  Food(
    id: 16,
    picturePath: 'https://i.pinimg.com/236x/cf/4f/16/cf4f1651362bb694e9fbe7142a930925.jpg',
    name: 'Sop Buntut',
    description: 'Sop buntut sapi dengan kuah bening yang gurih dan potongan buntut yang empuk.',
    price: 65000,
    rate: 4.7,
  ),
  Food(
    id: 17,
    picturePath: 'https://i.pinimg.com/236x/4e/13/f3/4e13f353e4c6f8c3bf4eb6db86e376f2.jpg',
    name: 'Ayam Goreng Kremes',
    description: 'Ayam goreng dengan bumbu kremes yang renyah dan gurih, disajikan dengan sambal dan lalapan.',
    price: 35000,
    rate: 4.5,
  ),
];