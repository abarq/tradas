function insertCaption( this, varargin )

TitleAutoText = ''; %?
position = 0;   %?
n=numel(varargin);
if n==1
    text = varargin{1};
    label = 'Figure';
elseif n==2
    text = varargin{1};
    label = varargin{2};
elseif n==3
    text = varargin{1};
    label = varargin{2};
    position = varargin{3};
else
    error('Wrong number of input');
end
if (strcmpi(text,'table') || strcmpi(text,'tabell')) && n<3
    position=1;
end

this.actxWord.Selection.InsertCaption( label, text, TitleAutoText, position );
newline(this,1);

end