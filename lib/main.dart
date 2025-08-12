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
            Padding(
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
                      right: 20,
                      top: 20,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: const Icon(
                          Icons.directions_bike,
                          size: 60,
                          color: Colors.white,
                        ),
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
            
            const SizedBox(height: 20),
            
            // Category Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  _buildCategoryButton('All', true),
                  const SizedBox(width: 15),
                  _buildCategoryButton('', false, icon: Icons.flash_on),
                  const SizedBox(width: 15),
                  _buildCategoryButton('', false, icon: Icons.location_on),
                  const SizedBox(width: 15),
                  _buildCategoryButton('', false, icon: Icons.terrain),
                  const SizedBox(width: 15),
                  _buildCategoryButton('', false, icon: Icons.sports_motorsports),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Product Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.builder(
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
            ),
            
            const SizedBox(height: 20),
          ],
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
      },
      {
        'title': 'Road Helmet',
        'subtitle': 'SMITH - Trade',
        'price': '120',
        'image': 'assets/bike.png',
      },
      {
        'title': 'Mountain Bike',
        'subtitle': 'TREK - Fuel EX',
        'price': '2,499.99',
        'image': 'assets/bike.png',
      },
      {
        'title': 'Electric Bike',
        'subtitle': 'SPECIALIZED - Turbo',
        'price': '3,999.99',
        'image': 'assets/bike.png',
      },
    ];

    final data = productData[index];
    
    return Container(
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
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF34C8E8),
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    color: Color(0xFF34C8E8),
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
    );
  }

  Widget _buildBikeImage() {
    return Container(
      width: 100,
      height: 60,
      child: Stack(
        children: [
          // Bike frame (white)
          Positioned(
            left: 20,
            top: 20,
            child: Container(
              width: 60,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // Front wheel (black)
          Positioned(
            left: 15,
            top: 35,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // Back wheel (black)
          Positioned(
            right: 15,
            top: 35,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // Seat (brown/orange)
          Positioned(
            left: 25,
            top: 15,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: const Color(0xFFD2691E),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          // Handlebar (brown/orange)
          Positioned(
            right: 25,
            top: 15,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: const Color(0xFFD2691E),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelmetImage() {
    return Container(
      width: 80,
      height: 60,
      child: Stack(
        children: [
          // Helmet (white)
          Positioned(
            left: 20,
            top: 10,
            child: Container(
              width: 40,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
}
