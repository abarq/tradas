function s = styles( this )

s={};
for i=1:this.actxWord.ActiveDocument.Styles.Count
    s{end+1} = this.actxWord.ActiveDocument.Styles.Item(i).NameLocal;
end