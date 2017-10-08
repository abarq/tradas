function insertSymbol(this,symbol_int_p)
% symbol_int_p holds an integer representing a symbol, 
% the integer can be found in MSWord's insert->symbol window    
% 176 = degree symbol

this.actxWord.Selection.InsertSymbol(symbol_int_p);