function setColor( this, color )


try
    set( this.actxWord.Selection.Range.Style.Font, 'ColorIndex', color );
catch
    error('Could not set color to %s\nFor a list of available colors type "Colors( wordObject )"',color);
end