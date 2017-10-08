function this = Word( file, visible )

if nargin<2
    visible=false;
end

this.file = file;

% Start an ActiveX session with Word:
actxWord = actxserver('Word.Application');    

try
    if ~exist(file,'file');
        % Create new document:
        wordHandle = invoke(actxWord.Documents,'Add');
    else
        % Open existing document:
        wordHandle = invoke(actxWord.Documents,'Open',['"',file,'"']);
    end
catch err
    delete actxWord;    
    error(err.message);
end

this.wordHandle = wordHandle;
this.actxWord = actxWord;
this.defaultFont = this.actxWord.Selection.Style.Font;

this = class( this, 'Word' );

setVisible(this,visible);

end