import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_repository/pizza_repository.dart';
import 'package:pizza_story/screens/home/views/pizza_detail_screen.dart';

class PizzaGridView extends StatelessWidget {
  final Pizza pizza;
  const PizzaGridView({super.key, required this.pizza});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      clipBehavior: Clip.hardEdge,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> PizzaDetailScreen(pizza: pizza)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(pizza.picture),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: pizza.isVeg
                            ? Colors.green.shade400
                            : Colors.red.shade400,
                        borderRadius: BorderRadius.circular(30)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      pizza.isVeg ? 'VEG' : 'NON-VEG',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Text(
                      pizza.spicy == 1
                          ? '🌶️ BLAND'
                          : pizza.spicy == 2
                              ? '🌶️ BALANCE'
                              : '🌶️ SPICY',
                      style: TextStyle(
                          color: pizza.spicy == 1
                              ? Colors.green
                              : pizza.spicy == 2
                                  ? Colors.orange
                                  : Colors.red,
                          fontSize: 10),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                pizza.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                pizza.description,
                style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Text('Rs.${pizza.price - (pizza.price * pizza.discount/100)}',style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w700),),
                    const SizedBox(width: 5,),
                    Text('Rs.${pizza.price}', style: TextStyle(fontSize: 12, color: Colors.grey.shade500, fontWeight: FontWeight.w700, decoration: TextDecoration.lineThrough),),
                    const Spacer(),
                    IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.add_circled_solid))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
