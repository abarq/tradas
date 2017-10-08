function this = close(this)


% Close the word window:
invoke(this.wordHandle,'Close');
% Quit MS Word
invoke(this.actxWord,'Quit');
% Close Word and terminate ActiveX:
delete(this.actxWord);

end