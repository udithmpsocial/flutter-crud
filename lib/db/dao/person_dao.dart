import 'package:erp/db/entity/person.dart';
import 'package:floor/floor.dart';


@dao
abstract class PersonDao {


  @Query('SELECT * FROM Person')
  Future<List<Person>> findAllPersons();

  @Query('SELECT * FROM Person')
  Stream<List<Person>> findAllPersonsAsStream();

  @Query('SELECT * FROM Person WHERE id = :id')
  Future<Person> findPersonById(int id);

  @Query('SELECT * FROM Person WHERE Person.un = :un AND Person.pw = :pw')
  Future<Person> findPersonByUnPw(String un, String pw);

  @Query('SELECT * FROM Person WHERE id = (SELECT MAX(id) FROM Person)')
  Future<Person> findPersonMaxId();

  @update
  Future<int> updatePerson(Person person);

  @insert
  Future<int> insertPerson(Person person);

  @delete
  Future<int> removePerson(Person person);
}
