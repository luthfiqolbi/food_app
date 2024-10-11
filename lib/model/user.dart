part of 'models.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? address;
  final String? phoneNumber;
  final String? houseNumber;
  final String? city;
  final String? picturePath;
  static String? token;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.address,
    this.phoneNumber,
    this.houseNumber,
    this.city,
    this.picturePath,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? phoneNumber,
    String? houseNumber,
    String? city,
    String? picturePath,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      houseNumber: houseNumber ?? this.houseNumber,
      city: city ?? this.city,
      picturePath: picturePath ?? this.picturePath,
    );
  }

  factory User.fromJson(Map<String, dynamic> data) => User(
    id: data['id'],
    name: data['name'],
    email: data['email'],
    address: data['address'],
    houseNumber: data['houseNumber'],
    phoneNumber: data['phoneNumber'],
    city: data['city'],
    picturePath: data['profile_photo_url'],
  );

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        password,
        address,
        houseNumber,
        phoneNumber,
        city,
        picturePath,
      ];
}

User mockUser = User(
    id: 1,
    name: 'Musalim Ucup',
    email: 'ucupweb@gmail.com',
    password: "12345678",
    address: 'Jl, Setiabudi No. 193',
    houseNumber: 'A2',
    phoneNumber: '08123456789',
    city: 'Batam',
    picturePath:
        "https://i.pinimg.com/474x/24/f7/d2/24f7d287c96762cb40a3683809d8200a.jpg");
