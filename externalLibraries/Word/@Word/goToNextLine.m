function goToNextLine(this)

n = currentLine(this)+1;
goTo(this,'wdGoToLine','wdGoToAbsolute',n);