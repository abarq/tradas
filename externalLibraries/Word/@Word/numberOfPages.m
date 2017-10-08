function n = numberOfPages( this )

n = this.actxWord.ActiveDocument.Content.Information(1);

end
