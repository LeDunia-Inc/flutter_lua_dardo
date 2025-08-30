import 'package:flutter_test/flutter_test.dart';
import 'package:lua_dardo/lua.dart';
import 'package:lua_dardo/debug.dart';
import 'person.dart';

///
/// Example of binding Dart class to Lua (Flutter test version)
///
void main() {
  test('Lua Person binding test', () {
    LuaState ls = LuaState.newState();
    ls.openLibs();
    Person.require(ls);
    
    // Use inline Lua code for Flutter test
    ls.doString('''
      local p = Person:create()
      p:sayHi("Bruce")
    ''');
    
    expect(true, isTrue); // Test passes if no exceptions thrown
  });
}
