function scalePicture( hPic, varargin )
%Width and height in cm

[varargin,height]=getarg(varargin,'height',[]);
height=height{:}.*28.35;
[varargin,width]=getarg(varargin,'width',[]);
width=width{:}.*28.35;
[varargin,LockAspectRatio]=getarg(varargin,'LockAspectRatio',true);
LockAspectRatio=LockAspectRatio{:};

if ~isempty(varargin)
    error('Unknown arguments specified');
end

if isempty(width) && isempty(height)
    error('You must specify either a ''width'' or ''height'' argument ');
end

set(hPic,'LockAspectRatio',LockAspectRatio);
if ~isempty(height)
    set(hPic,'Height',height);
end
if ~isempty(width)
    set(hPic,'Width',width);
end