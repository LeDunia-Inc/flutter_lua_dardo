import 'package:lua_dardo/lua.dart';
import 'package:lua_dardo/debug.dart';
import 'person.dart';
import 'dart:io';

///
/// Example of binding Dart class to Lua (standalone version)
/// Run with: cd test && dart standalone_test.dart
///
void main() {
  LuaState ls = LuaState.newState();
  ls.openLibs();
  Person.require(ls);
  
  // Check if test.lua file exists
  if (File('test.lua').existsSync()) {
    ls.loadFile("test.lua");
    // check the stack,only for debugging
    ls.printStack();
    ls.pCall(0, 0, 1);
  } else {
    // Use inline Lua code if file doesn't exist
    print('test.lua not found, using inline Lua code...');
    ls.doString('''
      local p = Person:create()
      p:sayHi("Bruce")
    ''');
  }
  
  print('Test completed successfully!');
}
