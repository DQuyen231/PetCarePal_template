
abstract class DataService<T>{

  Future<T> fetchData();

  Future<T> createData();

  Future<T> updateData();
  
  Future<T> deleteData();

}