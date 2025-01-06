import 'package:flutter/material.dart';
import 'dart:math'; // ใช้สำหรับสุ่มเมนู
 
void main() {
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodOrderScreen(),
    );
  }
}
 
class FoodOrderScreen extends StatefulWidget {
  @override
  _FoodOrderScreenState createState() => _FoodOrderScreenState();
}
 
class _FoodOrderScreenState extends State<FoodOrderScreen> {
  final List<Dish> dishes = [
    Dish(name: "Pizza", price: 150, ingredients: ["Dough", "Cheese", "Tomato Sauce"]),
    Dish(name: "Burger", price: 120, ingredients: ["Bun", "Beef", "Lettuce"]),
    Dish(name: "Sushi", price: 180, ingredients: ["Rice", "Fish", "Seaweed"]),
    Dish(name: "Soup", price: 90, ingredients: ["Broth", "Vegetables", "Chicken"]),
  ];
 
  final List<Dish> allDishes = [
    Dish(name: "Taco", price: 80, ingredients: ["Tortilla", "Beef", "Cheese"]),
    Dish(name: "Pasta", price: 140, ingredients: ["Pasta", "Tomato Sauce", "Cheese"]),
    Dish(name: "Salad", price: 70, ingredients: ["Lettuce", "Tomato", "Dressing"]),
    Dish(name: "Steak", price: 200, ingredients: ["Beef", "Garlic", "Butter"]),
  ];
 
  void addRandomDish() {
    final random = Random();
    final newDish = allDishes[random.nextInt(allDishes.length)];
 
    setState(() {
      dishes.add(newDish);
    });
  }
 
  @override
  Widget build(BuildContext context) {
    int totalPrice = dishes.fold(0, (sum, dish) => sum + dish.price);
 
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo : Food Order - Total Price: $totalPrice'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: dishes.length,
        itemBuilder: (context, index) {
          final dish = dishes[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange.shade100,
              child: Text('${dish.price}'),
            ),
            title: Text('Dish $index is ${dish.name}'),
            subtitle: Text(
                'This menu ingredients are ${dish.ingredients.join(", ")}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addRandomDish, // เมื่อกดปุ่ม "+" จะเพิ่มเมนูแบบสุ่ม
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
 
class Dish {
  final String name;
  final int price;
  final List<String> ingredients;
 
  Dish({required this.name, required this.price, required this.ingredients});
}
