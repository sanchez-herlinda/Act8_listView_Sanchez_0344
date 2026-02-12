import 'package:flutter/material.dart';

void main() => runApp(AppRestaurantee());

class AppRestaurantee extends StatelessWidget {
  const AppRestaurantee({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurante',
      home: ComidaItaliana(),

    );
  }
}// fin clase AppRestaurantee


class ComidaItaliana extends StatelessWidget {
  const ComidaItaliana({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurante La Roma 6-J',
          style: TextStyle(color: Color.fromARGB(255, 46, 67, 75)),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 170, 217, 255),
        leading: const Icon(
          Icons.camera_alt,
          color: Color.fromARGB(255, 83, 134, 192),
        ),
        actions: const [
          Icon(Icons.restaurant, color: Color.fromARGB(255, 83, 134, 192)),
          SizedBox(width: 15),
          Icon(Icons.restaurant_menu, color: Color.fromARGB(255, 83, 134, 192)),
          SizedBox(width: 15),
        ],
      ),

body: ListView.builder(
  padding: const EdgeInsets.all(16.0),
  itemCount: 4, // Definimos los 4 elementos
  itemBuilder: (context, index) {
    // Definimos los datos dinámicamente según el índice
    List<Map<String, dynamic>> items = [
      {'t': 'Mis Reservaciones', 's': 'Edita tus datos', 'i': Icons.person, 'c': Colors.blueAccent},
      {'t': 'Menu', 's': 'Todos los platillos', 'i': Icons.wallet, 'c': Colors.purpleAccent},
      {'t': 'Pedidos', 's': 'Tienes 3 pendientes', 'i': Icons.chat_bubble_outline, 'c': Colors.orangeAccent},
      {'t': 'Promociones', 's': 'Promociones del mes del Amor', 'i': Icons.settings, 'c': Colors.cyanAccent},
    ];

    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        // LEADING: Icono con fondo circular moderno
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: items[index]['c'].withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(items[index]['i'], color: items[index]['c']),
        ),
        // TEXT: Título y subtítulo
        title: Text(
          items[index]['t'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(items[index]['s']),
        // TRAILING: Acción interactiva
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
        // FUNCIONALIDAD: Acción al tocar
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Abriendo ${items[index]['t']}...'),
              backgroundColor: items[index]['c'],
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          );
        },
      ),
    );
  },
),


    );
  }
}// fin clase ComidaItaliana