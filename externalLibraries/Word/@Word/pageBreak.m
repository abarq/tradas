function pageBreak( this, varargin )

n=1;
if ~isempty(varargin)
    n = varargin{1};
end
for i=1:n
    this.actxWord.Selection.InsertBreak;
end


end
