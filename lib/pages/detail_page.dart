import 'package:flutter/material.dart';
import 'package:pokeapp/models/pokemon_model.dart';
import 'package:pokeapp/ui/widgets/item_type_widget.dart';

import '../ui/general/colors.dart';
import '../ui/widgets/item_data_widget.dart';

class DetailPage extends StatelessWidget {
  PokemonModel pokemon;
  String? nextPokemonEvolutionImage;

  DetailPage({required this.pokemon, required this.nextPokemonEvolutionImage});

  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colorsPokemon[pokemon.type.first],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: heigth * 0.12,
            right: -30.0,
            child: Image.asset(
              'assets/images/pokeball.png',
              height: 200.0,
              color: Colors.white.withOpacity(0.27),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      pokemon.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      children: pokemon.type
                          .map((e) => ItemTypeWidget(
                                text: e,
                                color: Colors.white,
                                textColor: Colors.white,
                              ))
                          .toList(),
                    )
                  ],
                ),
                Text(
                  "#${pokemon.num}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      //data
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Column(
                          children: [
                            const Text(
                              "About Pokemon",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ItemDataWidget(
                                title: "Heigth:", data: pokemon.height),
                            ItemDataWidget(
                                title: "Weight:", data: pokemon.weight),
                            ItemDataWidget(
                                title: "Candy:", data: pokemon.candy),
                            ItemDataWidget(
                                title: "Candy Count:",
                                data: pokemon.candyCount.toString()),
                            SizedBox(
                              height: 8.0,
                            ),
                            Row(children: [
                              const Text(
                                "Multipliers",
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14.0,
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              ...pokemon.multipliers
                                      ?.map((e) => ItemTypeWidget(
                                            text: e.toString(),
                                            color: Colors.yellow,
                                            textColor: Colors.black,
                                          ))
                                      .toList() ??
                                  [],
                            ]),
                            SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: const Text(
                                    "Weaknesses",
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Expanded(
                                  child: Wrap(
                                    children: pokemon.weaknesses
                                        .map((e) => ItemTypeWidget(
                                              text: e,
                                              color: Colors.red,
                                              textColor: Colors.white,
                                            ))
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            const Text(
                              "Next Evolution",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            pokemon.nextEvolution != null &&
                                    pokemon.nextEvolution!.length > 0
                                ? Image.network(
                                    nextPokemonEvolutionImage!,
                                  )
                                : SizedBox(
                                    height: 1,
                                  ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              pokemon.nextEvolution != null &&
                                      pokemon.nextEvolution!.length > 0
                                  ? pokemon.nextEvolution![0].name
                                  : '- No evolution -',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),

                      //imagen
                      Positioned.fill(
                          top: -90.0,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Image.network(
                              pokemon.img,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
