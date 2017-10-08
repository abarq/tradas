function f = fonts( this )

f={};
for i=1:this.actxWord.FontNames.Count
    f{end+1} = this.actxWord.FontNames.Item(i);
end