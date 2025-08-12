import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bike App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF242C3B),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Choose Your Bike',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF34C8E8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Main Promotional Card
              Transform(
                transform: Matrix4.identity()
                  ..rotateZ(0.5 * 3.14159 / 180)
                  ..scale(1.02),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF34C8E8), Color(0xFF4E4AF2)],
                      ),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF34C8E8).withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        // Bike Image
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Image.asset(
                            'assets/bike.png',
                            width: 140,
                            height: 140,
                            fit: BoxFit.contain,
                          ),
                        ),
                        // Discount Text
                        Positioned(
                          left: 20,
                          bottom: 20,
                          child: const Text(
                            '30% Off',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

                          // Category Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Transform(
                    transform: Matrix4.identity()
                      ..rotateZ(1.0 * 3.14159 / 180)
                      ..scale(1.05),
                    child: _buildCategoryButton('All', true),
                  ),
                  const SizedBox(width: 15),
                  Transform(
                    transform: Matrix4.identity()
                      ..rotateZ(-0.8 * 3.14159 / 180)
                      ..scale(0.98),
                    child: _buildCategoryButton('', false, icon: Icons.flash_on),
                  ),
                  const SizedBox(width: 15),
                  Transform(
                    transform: Matrix4.identity()
                      ..rotateZ(0.6 * 3.14159 / 180)
                      ..scale(1.03),
                    child: _buildCategoryButton('', false, icon: Icons.location_on),
                  ),
                  const SizedBox(width: 15),
                  Transform(
                    transform: Matrix4.identity()
                      ..rotateZ(-1.2 * 3.14159 / 180)
                      ..scale(0.97),
                    child: _buildCategoryButton('', false, icon: Icons.terrain),
                  ),
                  const SizedBox(width: 15),
                  Transform(
                    transform: Matrix4.identity()
                      ..rotateZ(0.4 * 3.14159 / 180)
                      ..scale(1.01),
                    child: _buildCategoryButton('', false, icon: Icons.sports_motorsports),
                  ),
                ],
              ),
            ),

              const SizedBox(height: 20),

              // Rotated Widgets Section
              _buildRotatedWidgets(),

              const SizedBox(height: 20),

              // Product Grid
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return _buildProductCard(index);
                  },
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF34C8E8), Color(0xFF4E4AF2)],
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF34C8E8).withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildCategoryButton(String text, bool isSelected, {IconData? icon}) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: isSelected
          ? const Color(0xFF34C8E8)
          : Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: icon != null
        ? Icon(
            icon,
            color: Colors.white,
            size: 24,
          )
        : Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
    );
  }

  Widget _buildProductCard(int index) {
    final List<Map<String, dynamic>> productData = [
      {
        'title': 'Road Bike',
        'subtitle': 'PEUGEOT - LR01',
        'price': '1,999.99',
        'image': 'assets/bike.png',
        'isFavorite': true,
        'rotation': 0.9,
        'scale': 1.0,
      },
      {
        'title': 'Road Helmet',
        'subtitle': 'SMITH - Trade',
        'price': '120',
        'image': 'assets/bike.png',
        'isFavorite': false,
        'rotation': 0.9,
        'scale': 0.95,
      },
      {
        'title': 'Mountain Bike',
        'subtitle': 'TREK - Fuel EX',
        'price': '2,499.99',
        'image': 'assets/bike.png',
        'isFavorite': false,
        'rotation': 0.9,
        'scale': 1.0,
      },
      {
        'title': 'Electric Bike',
        'subtitle': 'SPECIALIZED - Turbo',
        'price': '3,999.99',
        'image': 'assets/bike.png',
        'isFavorite': true,
        'rotation': 0.9,
        'scale': 0.95,
      },
    ];

    final data = productData[index];

    return Transform(
      transform: Matrix4.identity()
        ..rotateZ(data['rotation'] * 2 / 360)
        ..scale(data['scale']),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1F2E),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with heart icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 20),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: data['isFavorite']
                        ? const Color(0xFF34C8E8).withOpacity(0.2)
                        : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFF34C8E8),
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      data['isFavorite']
                        ? Icons.favorite
                        : Icons.favorite_border,
                      color: const Color(0xFF34C8E8),
                      size: 16,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Product Image - Conditional based on product type
              Expanded(
                child: Center(
                  child: data['title'].contains('Helmet')
                    ? _buildHelmetImage()
                    : _buildBikeImage(),
                ),
              ),

              // Product Info
              Text(
                data['title'],
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                data['subtitle'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                '\$ ${data['price']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBikeImage() {
    return Container(
      width: 100,
      height: 60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/bike.png',
          width: 80,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHelmetImage() {
    return Container(
      width: 80,
      height: 60,
      child: Stack(
        children: [
          // Helmet (white) - using bike image as base
          Positioned(
            left: 20,
            top: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/bike.png',
                width: 40,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Helmet stand (black)
          Positioned(
            left: 35,
            top: 35,
            child: Container(
              width: 10,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF242C3B),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Main navigation bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.directions_bike, 'Bikes'),
              _buildNavItem(1, Icons.bar_chart, 'Stats'),
              _buildNavItem(2, Icons.shopping_cart, 'Cart'),
              _buildNavItem(3, Icons.person, 'Profile'),
              _buildNavItem(4, Icons.description, 'Docs'),
            ],
          ),
          // Elevated selected item
          if (_selectedIndex == 0)
            Positioned(
              left: 20,
              bottom: 0,
              child: Transform(
                transform: Matrix4.identity()
                  ..rotateZ(2.0 * 3.14159 / 180)
                  ..scale(1.08),
                child: Container(
                  width: 60,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFF34C8E8),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.directions_bike,
                        color: Colors.white,
                        size: 24,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Bikes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: 60,
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected
                ? const Color(0xFF34C8E8)
                : Colors.white.withOpacity(0.6),
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                  ? const Color(0xFF34C8E8)
                  : Colors.white.withOpacity(0.6),
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget جديد يستخدم Transform.rotate مع زوايا مختلفة
  Widget _buildRotatedWidgets() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Text(
            'Rotated Elements',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
                    Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // عنصر مائل بزاوية 45 درجة
              Transform(
                transform: Matrix4.identity()
                  ..rotateZ(1 * 3.14159 / 180)
                  ..scale(0.95),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFF34C8E8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.directions_bike,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              
              // عنصر مائل بزاوية -30 درجة
              Transform(
                transform: Matrix4.identity()
                  ..rotateZ(1 * 3.14159 / 180)
                  ..scale(0.9),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4E4AF2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.flash_on,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              
              // عنصر مائل بزاوية 90 درجة
              Transform(
                transform: Matrix4.identity()
                  ..rotateZ(1 * 3.14159 / 180)
                  ..scale(0.8),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD2691E),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.terrain,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // عنصر مائل بزاوية متغيرة
          Transform(
            transform: Matrix4.identity()
              ..rotateZ(1 * 3.14159 / 180)
              ..scale(1.05),
            child: Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF34C8E8), Color(0xFF4E4AF2)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  'Rotated Text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
