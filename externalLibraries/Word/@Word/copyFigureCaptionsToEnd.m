function copyFigureCaptionsToEnd(this, chapterText,chapterStyle)
%Copies all figure captions to separate pages at the end of the document
%Adds a new chapter with chapterText and chapterStyle, if specified

if nargin<2
    chapterText='';
end
if nargin<3
    chapterStyle='';
end

if ~isempty(chapterText) && isempty(chapterStyle)
    error('A chapter style must also be specified when chapter text is specified');
end

captions = getCaptions(this);
ind=strfind(captions,'Figure');ind=cellfun(@sum,ind);
ind=ind==1;
captions=captions(ind);
goToEndOfDocument(this);
for i=1:numel(captions)
    pageBreak(this);
    if i==1 && ~isempty(chapterText)
        addText(this,chapterText,chapterStyle);
    end
    addText(this,captions{i});        
end