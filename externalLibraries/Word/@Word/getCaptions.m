function captions = getCaptions(this)

selectAll(this);
tmp=getWordHandle(this);
p=tmp.Selection.Paragraphs;

captions = {};
for i=1:p.Count    
    if strcmpi(get(p.Item(i).Range.ParagraphStyle,'namelocal'),'Caption')
        txt = get(p.Item(i).Range,'Text');
        if ischar(txt)
            txt={txt};            
        end
        captions(end+1)=txt;
    end
end