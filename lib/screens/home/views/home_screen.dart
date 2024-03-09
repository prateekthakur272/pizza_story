import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_repository/pizza_repository.dart';
import 'package:pizza_story/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza_story/screens/home/blocs/get_pizza_bloc/get_pizza_bloc.dart';
import 'package:pizza_story/screens/home/blocs/widgets/pizza_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          children: [
            Image.asset(
              'assets/8.png',
              scale: 14,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              'Pizza Story',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.cart)),
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(SignOutRequired());
              },
              icon: const Icon(CupertinoIcons.arrow_right_to_line))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<GetPizzaBloc, GetPizzaState>(
            builder: (context, state) {
              if (state is GetPizzaSuccess) {
                return GridView.builder(
                  itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 9/16),
                    itemBuilder: (context, index) => PizzaGridView(pizza: Pizza(name: 'Peproni', pizzaId: '123', isVeg: true, description: 'nice spicy pizza', discount: 10, price: 100, picture: 'https://www.licious.in/blog/wp-content/uploads/2020/12/Chilly-chicken-Pizza-min.jpg', macros: Macros(calories: 114, proteins: 14, fat: 20, carbs: 12), spicy: 1),));
              }
              if(state is GetPizzaLoading){
                return const CircularProgressIndicator();
              }
              return const Text('Some error occurred');
            },
          ),
        ),
      ),
    );
  }
}
