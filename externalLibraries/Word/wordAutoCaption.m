function wordAutoCaption( varargin )
%insert figures in a word document and scale them so that there are two
%figures on each page, plus a caption for each figure that goes over
%'captionLines' lines(default is 2). The figures are linked to the source
%image. It is also possible to specify a width or height for all images (in pixels).
%The aspect ratio is kept.
%
%Usage:
%wordAutoCaption;   %just inserts the images with a caption
%wordAutoCaption( 'scale',true,'captionLines', 3 );
%wordAutoCaption( 'scale',true,'captionLines', 3, 'visible', true, 'captionFunc', 'CreateCaptionFromFilenames' );
%wordAutoCaption( 'width', 408 ); %here all images are set to have a width of 408 pixels. No
%other scaling are performed.
%Note that if you save the document afterwards, all figure captions are
%somehow converted to Level 1 outline (should be body text).
%Is better to copy the content of the document to your report.
%A height of 10 cm (283.5 pixels) fits 2 figures + 2 three-lined captions
%330 pixels for one image per side

[varargin,visible] = getarg(varargin,'visible',true);
if iscell(visible), visible=visible{:}; end
[varargin,clines] = getarg(varargin,'captionLines',2);
if iscell(clines), clines = clines{:}; end
[varargin,scale] = getarg(varargin,'scale',false);
if iscell(scale), scale = scale{:}; end
[varargin,captionFunc] = getarg(varargin,'captionFunc','');
if iscell(captionFunc), captionFunc = captionFunc{:}; end


    %if a width is specified, all images are given this width. no other scaling
    %is performed.
    height = getarg(varargin,'height',nan);
    if iscell(height), height = height{:}; end
    width = getarg(varargin,'width',nan);
    if iscell(width), width = width{:}; end

    if scale
        if ~isnan(width) || ~isnan(height)
            error('Can`t mix height/width & scaling');
        end
    end


    [imgs,p] = uigetfile('*.*','MultiSelect', 'on');
    if isnumeric(imgs)
        return;
    end
    if ~iscell(imgs)
        imgs={imgs};
    end
    p=repmat({p},size(imgs));
    imgs = strcat(p,imgs);



    %open file
    [actxWord, wordHandle] = startWord( visible );
    set(actxWord,'Visible',visible);



    %select where to paste figures
    % msgbox('Click in the document where you want to start inserting the figures. Then press any key after closing this messagebox.');
    % disp('Press any key when ready');
    % pause;


    for j=1:numel(imgs)

        insertPicture( imgs{j} );
        goToEndOfLine;
        newline;
        if ~isempty(captionFunc) && ischar(captionFunc)
            captionFunc = str2func(captionFunc);
        end
        if ~isempty(captionFunc)
            text = captionFunc(imgs{j});
        else
           text = sprintf('\n\n\n');
        end
        insertCaption( text );
        newline;
        %newline(clines);
        %go to end of document
        end_of_doc = get( actxWord.activedocument.content, 'end' );
        set( actxWord.Application.Selection, 'Start', end_of_doc );
        set( actxWord.Application.Selection, 'End' ,end_of_doc );
    end



    if scale
        scaleAllImages( clines );
    elseif ~isnan(height) || ~isnan(width)
        setWidth( width, height );
    end

    actxWord.Visible=true;
    %closeWord;


    function setWidth( width, height )
    %set the same width on all images


    %select entire document
    selectAll;

    %loop all pictures & scale them
    shapes = actxWord.Selection.InlineShapes;
    ns = shapes.Count;
    for i=1:ns
        type = shapes.Item(i).Type;
        if ~any(strcmpi(type,{'wdInlineShapeLinkedPicture','wdInlineShapePicture'}))
            continue;
        end

        w = get(shapes.Item(i),'Width');
        h = get(shapes.Item(i),'Height');
        ratio = w/h;
        %set width & height
        if isnan(height)
            height = width/ratio;
        end
        if isnan(width)
            width = height*ratio;
        end
        set(shapes.Item(i),'Width',width);
        set(shapes.Item(i),'Height',height);
        %set(shapes.Item(i),'LockAspectRatio','msoFalse');
        
        %             set(shapes.Item(i),'ScaleWidth',scale);
        %             set(shapes.Item(i),'Scaleheight',scale);
    end

    end

    function scaleAllImages( clines )
    %scale all images in the document with a factor between 100 & 0
    %100 is normal size

    %1 newline for each figure, 1 newline for each caption, and a
    %newline after each caption
    newlines = 2+2*clines;

    factor = 100;
    while 1

        %select entire document
        selectAll;

        %loop all pictures & scale them
        shapes = actxWord.Selection.InlineShapes;
        ns = shapes.Count;
        n=0;
        for i=1:ns
            type = shapes.Item(i).Type;
            if ~any(strcmpi(type,{'wdInlineShapeLinkedPicture','wdInlineShapePicture'}))
                continue;
            else
                n=n+1;
            end

            %scale the picture
            set(shapes.Item(i),'ScaleHeight',factor);
            set(shapes.Item(i),'ScaleWidth',factor);
        end

        %check if there are two images & 4 lines on each page
        ok = true;
        nP = getNumberOfPages;
        if mod(n,2)~=0
            nP=nP-1;
        end
        for i=1:nP
            selectPage(i);

            pageShapes = actxWord.Selection.InlineShapes;
            nPageShapes = pageShapes.Count;
            nFigs  = 0;
            nLines = actxWord.Selection.Paragraphs.Count;
            for k=1:nPageShapes
                type = pageShapes.Item(k).Type;
                if ~any(strcmpi(type,{'wdInlineShapeLinkedPicture','wdInlineShapePicture'}))
                    continue;
                else
                    nFigs = nFigs+1;
                end
            end
            if nFigs==0
                ok=true;
                break;
            end
            if nFigs~=2 || nLines~=newlines
                ok = false;
                break;
            end

        end
        if ok || factor < 4
            break;
        end

        factor = factor - 2;
    end

    end

    function [ actxWord, wordHandle ] = startWord( varargin )
    try
        visible=false;
        if numel(varargin)>0
            visible=varargin{1};
        end
        % Start an ActiveX session with Word:
        actxWord = actxserver('Word.Application');
        actxWord.Visible = visible;
        %if ~exist(file,'file');
        % Create new document:
        wordHandle = invoke(actxWord.Documents,'Add');
        %             else
        %                 % Open existing document:
        %                 wordHandle = invoke(actxWord.Documents,'Open',file);
        %             end
    catch
        delete(actxWord);
        s=lasterror;
        error(s.message);
    end
    end

    function closeWord

    % Save existing file:
    invoke(wordHandle,'Save');

    % Close the word window:
    invoke(wordHandle,'Close');
    % Quit MS Word
    invoke(actxWord,'Quit');
    % Close Word and terminate ActiveX:
    delete(actxWord);
    end


    function newline( varargin )

    n=1;
    if numel(varargin)==1
        n=varargin{1};
    end

    for i=1:n
        actxWord.Selection.TypeParagraph;
    end

    end


    function addText( text )

    actxWord.Selection.TypeText(text);

    end

    function pageBreak

    actxWord.Selection.InsertBreak;
    end

    %     function pasteFigure( file )
    %
    %         invoke(hdlActiveX.Selection, 'Paste');
    %
    %     end


    function goTo( varargin )
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

    actxWord.Selection.GoTo(what, which, count, name);
    if delete
        actxWord.Selection.Delete;
    end

    end % Goto

    function goToEndOfLine
    actxWord.Selection.EndKey;
    end

    function goToStartOfLine
    actxWord.Selection.HomeKey;
    end

    function insertCaption( varargin )
    
    text = '';
    TitleAutoText = ''; %?
    position = 0;   %?
    n=numel(varargin);
    if n==1
        TitleAutoText = varargin{1};
        label = 'Figure';
    elseif n==2
        TitleAutoText = varargin{1};
        label = varargin{2};
    else
        error('Wrong number of input');
    end

    actxWord.Selection.InsertCaption( label, TitleAutoText, text, position );
    end


    function n = getCurrentLine

    n = actxWord.Selection.Information(10);

    end


    function insertPicture( file, varargin )

    link        = true;
    savewithdoc = true;
    n = numel(varargin);
    if n==1
        link        = varargin{1};
    elseif n==2
        link        = varargin{1};
        savewithdoc = varargin{2};
    end
    actxWord.Application.Selection.InlineShapes.AddPicture( file, link, savewithdoc  );

    end


    function n = getNumberOfSelectedPages
    n = actxWord.Selection.Information(4);
    end

    function n = getNumberOfPages
    n = actxWord.ActiveDocument.Content.Information(1);
    end

    function goToPage( n )

    actxWord.Selection.GoTo(1, 1, n, '');

    end

    function selectPage( n )

    goToPage(n);
    start = get(actxWord.Selection,'Start');
    if getNumberOfPages==n
        end1 = get( actxWord.activedocument.content, 'End' );
    else
        goToPage(n+1);
        end1 = get(actxWord.Selection,'End');
    end
    set(actxWord.Selection,'Start',start);
    set(actxWord.Selection,'End',end1);
    end

    function selectAll
    actxWord.Selection.WholeStory;

    %         start = get( actxWord.activedocument.content, 'Start' );
    %         end1  = get( actxWord.activedocument.content, 'End' );
    %         set( actxWord.Selection, 'Start', start );
    %         set( actxWord.Selection, 'End' ,end1 );

    end



    function text = captionTextFunction( name )
        a=name;
        text = sprintf('\n\n\n');
    end

end