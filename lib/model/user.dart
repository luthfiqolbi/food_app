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