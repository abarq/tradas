function addText( this, text, style, n )

if nargin==2
    style='Normal';
    n=1;
elseif nargin==3
    n=1;
elseif nargin<2 || nargin>4
    error('4 inputs required');
end

setStyle(this,style);
if iscell(text)
    for i=1:numel(text)
        this.actxWord.Selection.TypeText(text{i});
        newline(this,1);
    end
else
    assert(ischar(text));
    this.actxWord.Selection.TypeText(text);
end
newline(this,n);

end
