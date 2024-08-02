import 'package:flutter/material.dart';
import 'login_page.dart'; // Pastikan LoginPage diimpor
import 'profile_page.dart';
import 'order_history_page.dart';
import 'about_us_page.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({super.key});

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  final List<Map<String, dynamic>> _categories = [
    {
      'name': 'Makanan',
      'items': [
        {
          'name': 'Nasi Goreng',
          'price': 15000,
          'image': 'assets/images/nasi_goreng.jpeg'
        },
        {
          'name': 'Mie Ayam',
          'price': 12000,
          'image': 'assets/images/mie_ayam.jpeg'
        },
        {'name': 'Bakso', 'price': 10000, 'image': 'assets/images/bakso.jpeg'},
        {'name': 'Sate', 'price': 20000, 'image': 'assets/images/sate.jpeg'},
        {'name': 'Soto', 'price': 15000, 'image': 'assets/images/soto.jpeg'},
      ]
    },
    {
      'name': 'Minuman',
      'items': [
        {
          'name': 'Teh Manis',
          'price': 5000,
          'image': 'assets/images/teh_manis.jpeg'
        },
        {'name': 'Kopi', 'price': 7000, 'image': 'assets/images/kopi.jpeg'},
        {
          'name': 'Jus Jeruk',
          'price': 10000,
          'image': 'assets/images/jus_jeruk.jpeg'
        },
        {'name': 'Susu', 'price': 8000, 'image': 'assets/images/susu.jpeg'},
        {
          'name': 'Air Mineral',
          'price': 3000,
          'image': 'assets/images/air_mineral.jpeg'
        },
      ]
    },
    {
      'name': 'Cemilan',
      'items': [
        {
          'name': 'Keripik',
          'price': 8000,
          'image': 'assets/images/keripik.jpeg'
        },
        {'name': 'Kacang', 'price': 6000, 'image': 'assets/images/kacang.jpeg'},
        {'name': 'Permen', 'price': 2000, 'image': 'assets/images/permen.jpeg'},
        {
          'name': 'Coklat',
          'price': 10000,
          'image': 'assets/images/coklat.jpeg'
        },
        {
          'name': 'Biskuit',
          'price': 5000,
          'image': 'assets/images/biskuit.jpeg'
        },
      ]
    },
  ];

  final List<Map<String, dynamic>> _cart = [];
  final List<Map<String, dynamic>> _orderHistory = [];

  final Map<String, int> _selectedQuantities = {};

  void _updateCart(Map<String, dynamic> item, int quantity) {
    setState(() {
      final existingItemIndex =
          _cart.indexWhere((cartItem) => cartItem['name'] == item['name']);

      if (existingItemIndex != -1) {
        if (quantity > 0) {
          _cart[existingItemIndex]['quantity'] = quantity;
        } else {
          _cart.removeAt(existingItemIndex);
        }
      } else if (quantity > 0) {
        _cart.add({
          'name': item['name'],
          'price': item['price'],
          'quantity': quantity,
          'image': item['image'],
        });
      }
    });
  }

  void _showReceipt() {
    showDialog(
      context: context,
      builder: (context) {
        double total = _cart.fold(
            0, (sum, item) => sum + item['price'] * item['quantity']);
        return AlertDialog(
          title: Text('KERANJANG'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_cart.isEmpty)
                  Text('Keranjang kamu kosong, ayo jajan!')
                else
                  ..._cart.map((item) {
                    return ListTile(
                      title: Text(item['name']),
                      subtitle: Text('Jumlah: ${item['quantity']}'),
                      trailing: Text('Rp ${item['price'] * item['quantity']}'),
                    );
                  }).toList(),
                if (_cart.isNotEmpty) ...[
                  Divider(),
                  ListTile(
                    title: Text('Total'),
                    trailing: Text('Rp $total'),
                  ),
                ],
              ],
            ),
          ),
          actions: [
            if (_cart.isNotEmpty)
              TextButton(
                onPressed: () {
                  _confirmOrder();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Konfirmasi Pesanan',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            if (_cart.isNotEmpty)
              TextButton(
                onPressed: () {
                  setState(() {
                    _cart.clear();
                  });
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Batalkan Pesanan',
                  style: TextStyle(color: Colors.green),
                ),
              ),
          ],
        );
      },
    );
  }

  void _confirmOrder() {
    setState(() {
      _orderHistory.addAll(
        _cart
            .map((item) => {
                  'name': item['name'],
                  'price': item['price'],
                  'quantity': item['quantity'],
                  'image': item['image'],
                  'date': DateTime.now().toLocal().toString(),
                })
            .toList(),
      );
      _cart.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _categories.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          title: Text(
            'WARBUY',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green[800],
                  ),
                  child: Center(
                    child: CircleAvatar(
                      radius: 82,
                      backgroundImage: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.green[800]),
                  title: Text('Profile',
                      style: TextStyle(color: Colors.green[800])),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.history, color: Colors.green[800]),
                  title: Text('Riwayat Pemesanan',
                      style: TextStyle(color: Colors.green[800])),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OrderHistoryPage(orderHistory: _orderHistory),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info, color: Colors.green[800]),
                  title: Text('Tentang Kami',
                      style: TextStyle(color: Colors.green[800])),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutUsPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.green[800]),
                  title: Text('Logout',
                      style: TextStyle(color: Colors.green[800])),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green[800]!, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Container(
                color: Colors.grey[300],
                child: TabBar(
                  labelColor: Colors.green[800],
                  indicatorColor: Colors.green[800],
                  tabs: _categories
                      .map((category) => Tab(text: category['name']))
                      .toList(),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: _categories.map((category) {
                    return GridView.builder(
                      padding: EdgeInsets.all(8.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: category['items'].length,
                      itemBuilder: (context, index) {
                        final item = category['items'][index];
                        final currentQuantity =
                            _selectedQuantities[item['name']] ?? 1;
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          elevation: 4.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16.0)),
                                  child: Image.asset(
                                    item['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['name'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      'Rp ${item['price']}',
                                      style:
                                          TextStyle(color: Colors.green[800]),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: () {
                                            setState(() {
                                              if (currentQuantity > 1) {
                                                _selectedQuantities[
                                                        item['name']] =
                                                    currentQuantity - 1;
                                              }
                                            });
                                          },
                                        ),
                                        Text(
                                          '$currentQuantity',
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () {
                                            setState(() {
                                              _selectedQuantities[
                                                      item['name']] =
                                                  currentQuantity + 1;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    Center(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green[800],
                                        ),
                                        onPressed: () {
                                          final quantity = _selectedQuantities[
                                                  item['name']] ??
                                              1;
                                          if (quantity > 0) {
                                            _updateCart(item, quantity);
                                            setState(() {
                                              _selectedQuantities[
                                                  item['name']] = 0;
                                            });
                                          }
                                        },
                                        child: Text(
                                          'Pesan',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green[800],
          onPressed: _showReceipt,
          child: Icon(Icons.shopping_cart, color: Colors.white),
        ),
      ),
    );
  }
}
