function varargout = subsref( this, index )

persistent m;
if isempty( m )
        m.mutators = {'save','saveAs','close'};
        m.accessors = {'getBookmark','getWordHandle','colors','currentLine',...
            'fonts','insertPicture',...
            'insertTable','style','styles','numberOfPages','numberOfSelectedPages','getCaptions',...
            'numberOfLines'};
        m.commands = {'addArtisticEffect','addBookmark','addText','backspace',...
            'clear','color','copy',...
            'goTo','goToEndOfLine','goToLine','goToPage','goToStartOfLine',...
            'goToPreviousLine','goToNextLine',...
            'insertCaption','insertSymbol','insertTOC','newline','pageBreak',...
            'paste','saveAsPdf','selectAll','selectCurrentLine','selectPage',...
            'selectPreviousLine','selectNextLine',...
            'setBold','setColor','setDefaultFont','setFont','setFontSize',...
            'setItalic','setScreenUpdating','setSelectionEnd','setSelectionStart',...
            'setStyle','setSubscript','setSuperscript','setUnderline','setVisible',...
            'subsref','updateFields','updateTOC','copyFigureCaptionsToEnd','copyTablesAndTableCaptionsToEnd'};
end

for i=1:numel(index)
        
        if ~isa( this, 'Word' )
                [varargout{1:max([1,nargout])}] = deal( subsref( this, index(i:end) ) );
                return
        end
        
        switch index(i).type
                case '.'
                        % Calling methods: a.method(arg1,arg2,..)
                        if numel(index) > i && isequal( index(i+1).type, '()' )
                                args = index(i+1).subs;
                        else
                                args = {};
                        end

                        ind = strcmp( m.mutators, index(i).subs );
                        if any(ind) % mutate-method
                                callername = inputname(1);
                                func = str2func( m.mutators{ind} );
                                this = func( this, args{:} );
                                assignin( 'caller', callername, this );
                                if nargout
                                        varargout{1} = this;
                                end
                                return;
                        end

                        ind = strcmp( m.accessors, index(i).subs );
                        if any(ind) % access-method
                                func = str2func( m.accessors{ind} );
                                [varargout{1:max( [nargout,1] )}] = func( this, args{:} );
                                return
                        end

                        ind = strcmp( m.commands, index(i).subs );
                        if any(ind) % command-method
                                func = str2func( m.commands{ind} );
                                func( this, args{:} );
                                return;
                        end
                        
                        error('No public fields');
                
                otherwise
                        error( 'Unsupported subsref: %s', index(i).subs );
        end
end

