function addBookmark( this,bookname )

%set( this.actxWord.Selection.Range.Bookmarks.Add(bookname));
set( this.actxWord.ActiveDocument.Bookmarks.Add(bookname));


