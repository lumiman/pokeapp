import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/pokemon_model.dart';
import '../ui/widgets/item_pokemon_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pokemons = [];
  List<PokemonModel> pokemonModel = [];

  getDataPokemon() async {
    Uri _uri = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.Response _respone = await http.get(_uri);
    if (_respone.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(_respone.body);
      //pokemons = myMap["pokemon"];
      pokemonModel = myMap["pokemon"]
          .map<PokemonModel>((e) => PokemonModel.fromJson(e))
          .toList();

      setState(() {});
    }
  }

  String? getNextPokemonImage(PokemonModel pokemon) {
    if (pokemon.nextEvolution != null && pokemon.nextEvolution!.isNotEmpty) {
      String id = pokemon.nextEvolution![0].num;
      PokemonModel? nextPokemon = pokemonModel.firstWhere(
            (objeto) => objeto.num == id ,
      );
      if (nextPokemon != null) {
        print(nextPokemon.img);
        return nextPokemon.img;
      }
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    getDataPokemon();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12.0,
                ),
                const Text(
                  "PokeDex",
                  style: TextStyle(
                    fontSize: 34.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 1.35,
                  children: pokemonModel
                      .map(
                        (e) => ItemPokemonWidget(pokemon: e,nextPokemonEvolutionImage: getNextPokemonImage(e)),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
