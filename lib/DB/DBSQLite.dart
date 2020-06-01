import '../Objects/Produto.dart';

import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'doggie_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  Future<void> insertProduto(Produto produto) async {
    // Get a reference to the database.
    final Database db = await database;

    // Insert the Dog into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    await db.insert(
      'produtos',
      produto.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Produto>> produtos() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('dogs');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      var dog = Produto(
        cod: maps[i]['cod'] as int,
        pallet: maps[i]['pallet'] as int,
        lastro: maps[i]['lastro'] as int,
        cx: maps[i]['cx'] as int,
        un: maps[i]['un'] as int,
      );
      return dog;
    });
  }

  Future<void> updateProduto(Produto prod) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'produtos',
      prod.toMap(),
      // Ensure that the Dog has a matching id.
      where: "cod = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [prod.cod],
    );
  }

  Future<void> deleteProduto(int cod) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'produtos',
      // Use a `where` clause to delete a specific dog.
      where: "cod = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [cod],
    );
  }

  var p = Produto(
    cod: 1,
    cx: 2,
  );

  // Insert a dog into the database.
  await insertProduto(p);

  // Print the list of dogs (only Fido for now).
  print(await produtos());

  // Update Fido's age and save it to the database.
  p = Produto(
    cod: p.cod,
    lastro: 2,
  );
  await updateProduto(p);

  // Print Fido's updated information.
  print(await produtos());

  // Delete Fido from the database.
  await deleteProduto(p.cod);

  // Print the list of dogs (empty).
  print(await produtos());
}
