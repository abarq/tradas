function s = getBookmark( this,bookname )

%s=get( this.actxWord.Selection.Range.Bookmarks.Item(bookname));
s=get( this.actxWord.ActiveDocument.Bookmarks.Item(bookname));
