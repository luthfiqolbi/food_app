part of 'models.dart';

class User extends Equatable{
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final String? houseNumber;
  final String? phoneNumber;
  final String? city;
  final String? picturepath;
  static String? token;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.houseNumber,
    this.phoneNumber,
    this.city,
    this.picturepath,
});

  User copywith({
    int? id,
    String? name,
    String? email,
    String? address,
    String? houseNumber,
    String? phoneNumber,
    String? city,
    String? picturepath,
}) {
    return User (
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address?? this.address,
      houseNumber: houseNumber ?? this.houseNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      city: city ?? this.city,
      picturepath: picturepath ?? this.picturepath,
    );
  }

  factory User.fromjson(Map<String, dynamic> data) => User(
    id: data['id'],
    name: data['name'],
    email: data['email'],
    address: data['address'],
    houseNumber: data['houseNumber'],
    phoneNumber: data['phoneNumber'],
    city: data['city'],
    picturepath: data['profile_photo_url'],
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
    email,
    address,
    houseNumber,
    phoneNumber,
    city,
    picturepath,
  ];
}

User mockUser = User(
  id: 1,
  name: 'Luthfi',
  email: 'luthfi06@gmail.com',
  address: 'JL.Setia Budi',
  houseNumber: 'A1',
  phoneNumber: '081218147867',
  city: 'Jakarta',
  picturepath: 'https://i.pinimg.com/474x/e0/e7/71/e0e771441c61d57a0e27b6c53bea6584.jpg',
);