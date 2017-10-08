
function selectCurrentLine( this )

goToStartOfLine( this );
start = get(this.actxWord.Selection,'Start');
goToEndOfLine( this );
end1 = get(this.actxWord.Selection,'End');

set(this.actxWord.Selection,'Start',start);
set(this.actxWord.Selection,'End',end1);

end