function newline( this, varargin )

n=1;
if numel(varargin)==1
    n=varargin{1};
end

for i=1:n
    this.actxWord.Selection.TypeParagraph;
end

end