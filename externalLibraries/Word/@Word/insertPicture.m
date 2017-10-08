function h=insertPicture( this, file, varargin )

link        = true;
savewithdoc = true;
n = numel(varargin);
newLines=1;
height=[];
if n==1
    link        = varargin{1};
elseif n==2
    link        = varargin{1};
    savewithdoc = varargin{2};
elseif n==3
    link        = varargin{1};
    savewithdoc = varargin{2};
    newLines = varargin{3};
elseif n==4
    link        = varargin{1};
    savewithdoc = varargin{2};
    newLines = varargin{3};
    height = varargin{4};
elseif n>4
    error('Expected 1-3 optional inputs')
end

h = this.actxWord.Application.Selection.InlineShapes.AddPicture( file, link, savewithdoc  );
if ~isempty(height)
    scalePicture(h,'height',height);
end
newline(this,newLines);

end