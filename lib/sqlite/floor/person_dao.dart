// // dao/person_dao.dart

// import 'package:elegant_flutter/sqlite/floor/person.dart';
// import 'package:floor/floor.dart';

// @dao
// abstract class PersonDao {
//   @Query('SELECT * FROM Person')
//   Future<List<Person>> findAllPersons();

//   @Query('SELECT * FROM Person WHERE id = :id')
//   Stream<Person?> findPersonById(int id);

//   @insert
//   Future<void> insertPerson(Person person);
// }
