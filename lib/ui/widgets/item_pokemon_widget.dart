import 'package:flutter/material.dart';
import 'package:pokeapp/pages/detail_page.dart';
import 'package:pokeapp/ui/general/colors.dart';

import '../../models/pokemon_model.dart';
import 'item_type_widget.dart';

class ItemPokemonWidget extends StatelessWidget {
  PokemonModel pokemon;
  String? nextPokemonEvolutionImage;

  ItemPokemonWidget({required this.pokemon, required this.nextPokemonEvolutionImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      pokemon: pokemon,nextPokemonEvolutionImage: nextPokemonEvolutionImage,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
            color: colorsPokemon[pokemon.type.first],
            borderRadius: BorderRadius.circular(18.0)),
        child: Stack(
          children: [
            Positioned(
              bottom: -20,
              right: -20,
              child: Image.asset(
                'assets/images/pokeball.png',
                height: 120.0,
                color: Colors.white.withOpacity(0.27),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  ...pokemon.type
                      .map((e) => ItemTypeWidget(
                            text: e,color: Colors.white,textColor: Colors.white,
                          ))
                      .toList()
                  // Column(
                  //   children: types.map((e) => ItemTypeWidget()).toList(),
                  // )
                ],
              ),
            ),
            Positioned(
              bottom: -2,
              right: -2,
              child: Image.network(
                pokemon.img,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
