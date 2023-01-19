import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex02/pokemon_list_model.dart';

class PokemonProvider {
  Future<PokemonListModel> getPokemonList() async {
    var uri = Uri.https('pokeapi.co', 'api/v2/pokemon');
    var res = await http.get(uri);
    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      PokemonListModel pModel = PokemonListModel.fromJson(body);
      return pModel;
    } else {
      print("Can't get response from server");
      throw "Server exception";
    }
  }

  //TODO
  //create new method for get single pokemon detail
  //return type is PokemonModel
}
