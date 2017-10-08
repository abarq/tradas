function goTo( this, varargin )
% GOTO Jump to specified location in document

what   = 'wdGoToGraphic';
which  = 'wdGoToNext';
count  = 1;
name   = '';
delete = false;

n = numel(varargin);
if n==2
    what  = varargin{1};
    which = varargin{2};
elseif n==3
    what  = varargin{1};
    which = varargin{2};
    count = varargin{3};
elseif n==4
    what  = varargin{1};
    which = varargin{2};
    count = varargin{3};
    name = varargin{4};
elseif n==5
    what   = varargin{1};
    which  = varargin{2};
    count  = varargin{3};
    name   = varargin{4};
    delete = varargin{5};
elseif n>5
    error('Wrong number of input');
end

switch what
    case 'wdGoToBookmark'
        what = -1;
    case 'wdGoToComment'
        what = 6;
    case 'wdGoToEndnote'
        what = 5;
    case 'wdGoToEquation'
        what = 10;
    case 'wdGoToField'
        what = 7;
    case 'wdGoToFootnote'
        what = 4;
    case 'wdGoToGrammaticalError'
        what = 14;
    case 'wdGoToGraphic'
        what = 8;
    case 'wdGoToHeading'
        what = 11;
    case 'wdGoToLine'
        what = 3;
    case 'wdGoToObject'
        what = 9;
    case 'wdGoToPage'
        what = 1;
    case 'wdGoToPercent'
        what = 12;
    case 'wdGoToProofreadingError'
        what = 15;
    case 'wdGoToSection'
        what = 0;
    case 'wdGoToSpellingError'
        what = 13;
    case 'wdGoToTable'
        what = 2;
end

switch which % enum WdGoToDirection
    case 'wdGoToAbsolute'
        which = 1;
    case 'wdGoToFirst'
        which = 1;
    case 'wdGoToLast'
        which = -1;
    case 'wdGoToNext'
        which = 2;
    case 'wdGoToPrevious'
        which = 3;
    case 'wdGoToRelative'
        which = 2;
end

this.actxWord.Selection.GoTo(what, which, count, name);
if delete
    this.actxWord.Selection.Delete;
end

end % Goto
