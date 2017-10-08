function setSelectionStart( this )

start = get(this.actxWord.Selection,'Start');
if getNumberOfPages(this)==n
    end1 = get( this.actxWord.activedocument.content, 'End' );
else
    goToPage(this,n+1);
    end1 = get(this.actxWord.Selection,'End');
end
set(this.actxWord.Selection,'Start',start);
set(this.actxWord.Selection,'End',end1);
end