function insertTOC( this, varargin )

n=numel(varargin);
upper_heading_p=1;
lower_heading_p=3;
if n==2
	upper_heading_p=varargin{1};
	lower_heading_p=varargin{2};
elseif n>2
	error('Wrong number of inputs');
end

this.actxWord.ActiveDocument.TablesOfContents.Add(this.actxWord.Selection.Range,1,upper_heading_p,lower_heading_p);

newline(this);