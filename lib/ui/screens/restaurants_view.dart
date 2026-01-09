import 'package:finalexam/models/restaurant_type.dart';
import 'package:flutter/material.dart';

import '../../models/restaurant.dart';
import '../theme.dart';
import '../widgets/chip/restaurant_type_chip.dart';
import '../widgets/chip/stars_chip.dart';
import 'restuarant_detail.dart';


class RestaurantsView extends StatefulWidget {
  const RestaurantsView({super.key, required this.restaurants});

  final List<Restaurant> restaurants;

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  bool showOnlyKhmer = false;

  @override
  Widget build(BuildContext context) {
    final displayedRestaurants = showOnlyKhmer
        ? widget.restaurants
            .where((r) => r.type == RestaurantType.khmer)
            .toList()
        : widget.restaurants;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: const Text('Miam'),
      ),

      body: Column(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsetsGeometry.fromLTRB(10, 10, 10, 10)),
              Checkbox(
                value: showOnlyKhmer,
                onChanged: (value) {
                  setState(() {
                    showOnlyKhmer = value!;
                  });
                },
              ),

              Text('show only khmer resturant')
            ],
          ),

          Expanded(
            child: ListView.builder(
              itemCount: displayedRestaurants.length,
              itemBuilder: (context, index){
                final restaurant = displayedRestaurants[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    title: Text(restaurant.name),
                    subtitle: Row(
                      children: [
                        StarsChip(rate: restaurant.avgRate),
                        const SizedBox(width: 8),
                        RestaurantTypeChip(type: restaurant.type),
                      ],
                    ),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RestuarantDetail(
                            restaurant: restaurant,
                          ),
                        ),
                      );
                      setState(() {});
                    },

                  ),
                );
              }
            )
          
          )
        ],
      ),
    );
  }
}
