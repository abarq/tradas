function copyTablesAndTableCaptionsToEnd(this, captionAbove, chapterText,chapterStyle)
%Finds all table captions in the document, and all tables.
%Copies all tables to the end of the document, and paste the corresponding
%table caption (the number of table captions and tables must be the same)
%The option 'captionAbove' determines if the table caption should be pasted
%above or below the table (no automatic detection of this...)
%The option 'chapterText' and chapterStyle, if not empty, is used to add a
%new chapter before the first table.
%This function is primarily useful for publications, as some journals
%requires a list of figure captions and tables at the end.
%Note that for instance footnotes as regular text below a table is not
%detected and copied and must be done manually.
%See also the function 

if nargin<3
    chapterText='';
end
if nargin<4
    chapterStyle='';
end

if ~isempty(chapterText) && isempty(chapterStyle)
    error('A chapter style must also be specified when chapter text is specified');
end

captions = getCaptions(this);
ind=strfind(captions,'Table');
ind=cellfun(@sum,ind);
ind=ind==1;
tableCaptions = captions(ind);

goToEndOfDocument(this);

tmp=getWordHandle(this);
assert(tmp.Documents.Count==1,'Error, one document expected');
document = tmp.Documents.Item(1);
tables = document.Tables;
assert(tables.Count==numel(tableCaptions),'The number of tables and table captions in the document must be the same for this function to work!');
for i=1:tables.Count   
    t = tables.Item(i);
    t.Select;
    tmp.Selection.Copy;
    goToEndOfDocument(this);
    pageBreak(this);
    if i==1 && ~isempty(chapterText)
        addText(this,chapterText,chapterStyle);
    end
    if captionAbove
        addText(this,tableCaptions{i},'Normal',0);
    end
    tmp.Selection.Paste;
    if ~captionAbove
        addText(this,tableCaptions{i},'Normal',0);
    end
end
