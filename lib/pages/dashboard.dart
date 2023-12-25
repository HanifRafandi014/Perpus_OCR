import 'package:flutter/material.dart';
import 'package:perpus_ocr/pages/book_details.dart';
import 'notif_page.dart';
import 'bottomnavbar.dart'; // Import the BottomNavBar file

class DashboardWidget extends StatefulWidget {
  @override
  DashboardPage createState() => DashboardPage();
}

class DashboardPage extends State<DashboardWidget> {
  int _currentPage = 0;
  String _search = '';
  String _selectedFilter = 'All';
  List<Perpus> _perpuss = [
    Perpus('NewJeans.png', 'NewJeans', '14 January 2024',
        'Jakarta International Stadium', 'K-Pop'),
    Perpus('LeSserafim.png', 'Le Sserafim', '24 March 2024',
        'Stadion Gelora Bung Karno', 'K-Pop'),
    Perpus('coldplay.jpeg', 'Coldplay', '15 November 2023',
        'Stadion Gelora Bung Karno', 'Pop'),
    Perpus('bmth.jpeg', 'Bring Me The Horizon', '10 November 2023',
        'Beach City, Ancol, Jakarta', 'Rock'),
    // Add more perpuss as needed
  ];
  List<Perpus> _filterPerpuss = [];

  void _filterPerpuss() {
    _filterPerpuss = _filterPerpusList(_perpuss, _search, _selectedFilter);
  }

  List<Perpus> _filterPerpusList(
      List<Perpus> perpuss, String search, String selectedFilter) {
    return perpuss
        .where((perpus) => (perpus.name
                .toLowerCase()
                .contains(search.toLowerCase()) &&
            (selectedFilter == 'All' || perpus.category == selectedFilter)))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _selectedFilter = 'All';
    _filterPerpuss();
  }

  Widget build(BuildContext context) {
    // List<Perpus> _filteredPerpuss = _perpuss
    //     .where((perpus) =>
    //         perpus.name.toLowerCase().contains(_search.toLowerCase()))
    //     .toList();
    return Scaffold(
      body: Stack(
        children: [
          // Background Color
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [const Color(0xFF0E0837), const Color(0xFF322C5D)],
              ),
            ),
          ),
          // Container 1
          Positioned(
            top: 80.0,
            left: 30.0,
            right: 30.0,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo and App Name
                  Container(
                    child: Row(
                      children: [
                        // Logo
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          child: Image(
                            image: AssetImage('assets/img/singer.png'),
                            width: 15,
                            height: 15,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        // App Name
                        Text(
                          'PerpusNas',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Notification Icon
                  GestureDetector(
                    onTap: () {
                      // Handle action when notification icon is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationPage()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      alignment:
                          Alignment.center, // This line centers the child
                      child: Image(
                        image: AssetImage('assets/img/bell.png'),
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Container 2
          Positioned(
            top: 150.0,
            left: 30.0,
            right: 30.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              child: Row(
                children: [
                  // Search Icon
                  Image(
                    image: AssetImage('assets/img/search.png'),
                    width: 15,
                    height: 15,
                  ),
                  SizedBox(width: 10.0),
                  // Search Field
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _search = value;
                          _filterPerpuss(); // Add this line
                        });
                      },
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search Events',
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14.0,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Container 3
          Positioned(
            top: 240.0,
            left: 15.0,
            right: 15.0,
            child: Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Popular Event Text
                  Text(
                    'Popular Event',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  // Filter Buttons
                  Row(
                    children: [
                      _buildFilterButton('All', _selectedFilter == 'All', () {
                        setState(() {
                          _selectedFilter = 'All';
                          _filterPerpuss();
                        });
                      }),
                      SizedBox(width: 10.0),
                      // K-Pop Filter Button
                      _buildFilterButton('K-Pop', _selectedFilter == 'K-Pop',
                          () {
                        setState(() {
                          _selectedFilter = 'K-Pop';
                          _filterPerpuss();
                        });
                      }),
                      SizedBox(width: 10.0),
                      // Pop Filter Button
                      _buildFilterButton('Pop', _selectedFilter == 'Pop', () {
                        setState(() {
                          _selectedFilter = 'Pop';
                          _filterPerpuss();
                        });
                      }),
                      SizedBox(width: 10.0),
                      // Rock Filter Button
                      _buildFilterButton('Rock', _selectedFilter == 'Rock', () {
                        setState(() {
                          _selectedFilter = 'Rock';
                          _filterPerpuss();
                        });
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Container 4
          Positioned(
            top: 340.0,
            left: 30.0,
            right: 30.0,
            child: Container(
              height: 480.0, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _filteredPerpuss.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      _buildPerpusCard(
                        _filteredPerpuss[index].image,
                        _filteredPerpuss[index].name,
                        _filteredPerpuss[index].date,
                        _filteredPerpuss[index].location,
                      ),
                      SizedBox(height: 30.0), // Add padding between cards
                    ],
                  );
                },
              ),
            ),
          ),

          // Container 5 - Bottom Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavBar(
              currentPage: _currentPage,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build bottom navigation bar icons
  Widget _buildBottomNavBarIcon({
    required IconData iconData,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF0E0837) : Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Icon(
            iconData,
            color: isSelected ? Colors.white : const Color(0xFF9B9B9B),
            size: 20.0,
          ),
        ),
      ),
    );
  }

// Helper method to build filter buttons
  Widget _buildFilterButton(String text, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
          color: isSelected ? Colors.white : Colors.transparent,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12.0,
            color: isSelected ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

// Helper method to build perpus cards
  Widget _buildPerpusCard(
    String imagePath,
    String title,
    String date,
    String location,
  ) {
    return Container(
      width: double.infinity, // Use the full width of the parent
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color(0xFF251F4F),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Perpus Image
          Container(
            height: 175.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('assets/img/$imagePath'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          // Perpus Details in a Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Perpus Title, Date, and Location
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              // Buy Now Button
              InkWell(
                onTap: () {
                  // Handle Buy Now button tap
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TicketDetails(perpusName: title),
                    ),
                  );
                },
                child: Container(
                  width: 110.0,
                  height: 40.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Perpus {
  final String image;
  final String name;
  final String date;
  final String location;
  final String category;

  Perpus(this.image, this.name, this.date, this.location, this.category);
}
