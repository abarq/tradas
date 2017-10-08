function setFont( this, font )

try
    set( this.actxWord.Selection.Range.Style.Font, 'Name', font );
catch
	fonts_ = fonts(this); fonts_=sprintf('\n%s',fonts_{:});
    error('Could not set font %s. Available fonts are:',fonts_);
end