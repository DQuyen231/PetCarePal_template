class Pet {
  final String name;

  final String breed;
  final String imageUrl;

  Pet({
    required this.name,
    required this.breed,
    required this.imageUrl,
  });
}

List<Pet> pets = [
  Pet(name: 'Tom', breed: 'Persian', imageUrl: 'assets/images/avatar.png'),
  Pet(
      name: 'Buddy',
      breed: 'Golden Retriever',
      imageUrl: 'assets/images/avatar.png'),
  // Thêm các thú cưng khác
];
