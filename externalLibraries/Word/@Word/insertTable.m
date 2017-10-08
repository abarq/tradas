function h=insertTable(this,data,autoFit)
%Add a table which auto fits cell's size to contents

rows = size(data,1);
cols = size(data,2);

if nargin<3
    autoFit = 1;
end

% newline(this,1);
% this.actxWord.Selection.MoveUp;

%create the table
%Add = handle Add(handle, handle, int32, int32, Variant(Optional))
h=this.actxWord.ActiveDocument.Tables.Add(this.actxWord.Selection.Range,rows,cols,1,autoFit);
%set(h,'AllowAutoFit',0);
%Hard-coded optionals
%first 1 same as DefaultTableBehavior:=wdWord9TableBehavior
%last  1 same as AutoFitBehavior:= wdAutoFitContent

%     updating = get(this.actxWord,'ScreenUpdating');
%     pagination =  get(this.actxWord.options,'Pagination');
%     set(this.actxWord,'ScreenUpdating',0);
%     set(this.actxWord.options,'Pagination',false);


%write the data into the table
%w=waitbar(0,'Inserting table...'); k=1;
str='';
for r=1:rows
    for c=1:cols
        %waitbar(k/(rows*cols),w);
        %write data into current cell
        text = data{r,c};
        if isnumeric(text)
            %warning('Number detected at row %d column %d, will be converted to text',r,c);
            text = num2str(text);
        end
        if ~ischar(text)
            error('Data at row %d column %d is not a string',r,c);
        end
        str=sprintf('%s%s',str,text);
        if c<cols
            str=sprintf('%s\t',str);
        end
        
        %SLOW! Paste instead
        %             addText(this,text,'Normal',0);
        %         if(r*c==rows*cols)
        %             %we are done, leave the table
        %             this.actxWord.Selection.MoveDown;
        %         else%move on to next cell
        %             this.actxWord.Selection.MoveRight;
        %         end
        %             k=k+1;
    end
    if r<rows
        str=sprintf('%s\r\n',str);
    end
end
%close(w);

cols=get(h,'columns');
cols.Select;

tmp=clipboard('paste');
clipboard('copy',str);
paste(this);
clipboard('copy',tmp);

%h.Select;
%this.actxWord.Selection.Collapse;
%Selection.Collapse WdCollapseDirection.wdCollapseEnd

rows=get(get(h,'rows'),'last');
rows.Select;
this.actxWord.Selection.MoveDown;

%     set(h,'AllowAutoFit',autoFit);
%     set(this.actxWord,'ScreenUpdating',updating);
%     set(this.actxWord.options,'Pagination',pagination);