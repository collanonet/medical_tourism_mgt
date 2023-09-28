mixin Persistence {
  Future<bool> write(String key, String? value);
  Future<String?> read(String key);
  Future<bool> writeBool(String key, bool value);
  Future<bool?> readBool(String key);
  Future<bool> writeInt(String key, int value);
  Future<int?> readInt(String key);
  Future<bool> writeDouble(String key, double value);
  Future<double?> readDouble(String key);
  Future<bool> writeStringList(String key, List<String> value);
  Future<List<String>?> readStringList(String key);
}
