import 'package:flutter/material.dart';

import 'data_mobil.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.username});
  final String username;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  Color _color = Colors.green;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(_index == 0 ? 'Halo, ${widget.username}!' : 'Profil'),
    ),
    body: _index == 0
        ? ListView.builder(
            key: const PageStorageKey('cars'),
            padding: const EdgeInsets.all(16),
            itemCount: cars.length,
            itemBuilder: (context, index) {
              final car = cars[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => CarDetailPage(car: car),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CarImage(car: car, height: 190),
                      ListTile(
                        title: Text(car.fullName),
                        subtitle: Text('Tahun ${car.year}'),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        : SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 56,
                      backgroundColor: _color,
                      child: const Icon(
                        Icons.person,
                        size: 64,
                        color: Color.fromARGB(255, 4, 130, 29),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.username,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Saya bersumpah mengerjakan soal kuis ini dengan jujur dan tidak melakukan kecurangan apapun itu',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 28),
                    const Text('Pilih warna profil'),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _colorButton('Biru', Colors.blue),
                        _colorButton('Merah', Colors.red),
                        _colorButton('Ungu', Colors.purple),
                      ],
                    ),
                    const SizedBox(height: 28),
                    FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: _color,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute<void>(
                            builder: (_) => const LoginPage(),
                          ),
                          (_) => false,
                        );
                      },
                      icon: const Icon(Icons.logout),
                      label: const Text('Logout'),
                    ),
                  ],
                ),
              ),
            ),
          ),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _index,
      onTap: (index) => setState(() => _index = index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
      ],
    ),
  );
  Widget _colorButton(String label, Color color) => FilledButton(
    style: FilledButton.styleFrom(
      backgroundColor: color,
      foregroundColor: const Color.fromARGB(255, 1, 177, 66),
    ),
    onPressed: () => setState(() => _color = color),
    child: Text(label),
  );
}

class CarImage extends StatelessWidget {
  const CarImage({super.key, required this.car, required this.height});
  final Car car;
  final double height;
  @override
  Widget build(BuildContext context) => Image.network(
    car.imageUrl,
    height: height,
    width: double.infinity,
    fit: BoxFit.cover,
    semanticLabel: car.fullName,
    errorBuilder: (context, error, stackTrace) => SizedBox(
      height: height,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.directions_car, size: 64, color: Color.fromARGB(255, 2, 127, 44)),
          Text('Gambar tidak dapat dimuat'),
        ],
      ),
    ),
  );
}

class CarDetailPage extends StatelessWidget {
  const CarDetailPage({super.key, required this.car});
  final Car car;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(car.fullName)),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CarImage(car: car, height: 260),
        ),
        const SizedBox(height: 24),
        Text(car.fullName, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text('Tahun ${car.year}'),
        const SizedBox(height: 16),
        Text(
          car.formattedPrice,
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(color: Colors.green),
        ),
        const SizedBox(height: 24),
        Text('Deskripsi', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Text(car.description),
      ],
    ),
  );
}
