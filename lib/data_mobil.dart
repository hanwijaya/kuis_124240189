class Car {
  const Car({
    required this.id,
    required this.name,
    required this.brand,
    required this.year,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
  final int id;
  final String name;
  final String brand;
  final int year;
  final int price;
  final String description;
  final String imageUrl;
  String get fullName => '$brand $name';
  String get formattedPrice =>
      'Rp ${price.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (match) => '${match[1]}.')}';
}

final List<Car> cars = [
  Car(
    id: 1,
    name: 'Civic RS',
    brand: 'Honda',
    year: 2024,
    price: 595000000,
    description: 'mobil ibu ibu.',
    imageUrl: 'https://www.usnews.com/object/image/0000019b-0a10-d67d-afdb-4b3f41b70000/usn-2026-honda-civic-hatchback-sport-angular-front.JPG?update-time=1765400395305&size=responsiveGallery&format=webp',
  ),
  Car(
    id: 2,
    name: 'Fortuner GR Sport',
    brand: 'Toyota',
    year: 2024,
    price: 735000000,
    description: 'starboy UPN.',
    imageUrl:
        'https://imgcdn.oto.com/large/gallery/exterior/38/894/toyota-fortuner-front-angle-low-view-580768.jpg',
  ),
  Car(
    id: 3,
    name: 'Palisade',
    brand: 'Hyundai',
    year: 2024,
    price: 875000000,
    description: 'mobil auto pilot.',
    imageUrl:
        'https://okinews.disway.id/upload/875e9f569c4c490d07c1f622a76e47af.jpg',
  ),
  Car(
    id: 4,
    name: 'CX-5',
    brand: 'Mazda',
    year: 2023,
    price: 6250,
    description: 'banyak dikotbar setiap malming.',
    imageUrl:
        'https://imgcdn.oto.com/large/gallery/color/23/2199/mazda-3-2019-color-644561.jpg',
  ),
  Car(
    id: 5,
    name: 'Innova Zenix',
    brand: 'Toyota',
    year: 2024,
    price: 47500,
    description: 'mobil bapak bapak.',
    imageUrl: 'https://imgcdn.oto.com/large/gallery/exterior/38/2707/toyota-innova-zenix-hybrid-ev-front-angle-low-view-239610.jpg',
  ),
  Car(
    id: 6,
    name: 'HR-V',
    brand: 'Honda',
    year: 2024,
    price: 42500,
    description: 'mobil anak muda.',
    imageUrl:
        'https://imgcdnblog.carbay.com/wp-content/uploads/2022/03/23151625/All-new-Honda-HR-V-1.jpg',
  ),
  Car(
    id: 7,
    name: 'Alphard',
    brand: 'Toyota',
    year: 2024,
    price: 13570,
    description: 'Mobil Bahlil dan antek anteknya.',
    imageUrl:
        'https://res.cloudinary.com/mufautoshow/image/upload/f_auto,f_auto/w_1200/v1621137839/moas/news/1621137832_toyota-alphard-transformers-mpv-mewah-terbaik-di-indonesia.png',
  ),
  Car(
    id: 8,
    name: 'Kuda',
    brand: 'Lamborghini',
    year: 2023,
    price: 28506,
    description: 'Tahan Bantinkk.',
    imageUrl:
        'https://asset.kompas.com/crops/kBdDJHobQzbpVn0MCo4nkiWBeok=/416x0:4634x2812/1200x800/data/photo/2026/08/15/6a7fe4b3118c3.jpg',
  ),
  Car(
    id: 9,
    name: 'Model 3',
    brand: 'Tesla',
    year: 2024,
    price: 75000,
    description: 'Mobil listrik token PLN.',
    imageUrl: 'https://static.independent.co.uk/2025/10/10/16/58/Tesla-Model-Y-Performance.png?quality=75&width=1368&crop=3%3A2%2Csmart&trim=0%2C0%2C0%2C0&auto=webp',
  ),
  Car(
    id: 10,
    name: 'Mustang GT',
    brand: 'Ford',
    year: 2023,
    price: 12080,
    description: 'Mobil idaman gueh.',
    imageUrl:
        'https://www.drivencarguide.co.nz/media/jeqfj0zl/ford-mustang-gt-002.jpg?width=1028&quality=85&v=1dbc3dfca9f6a50',
  ),
];
