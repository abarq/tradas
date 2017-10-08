function updateTOC(this)

w = this.wordHandle;

for i=1:w.Fields.Count
        if strcmpi(w.Fields.Item(i).Type,'wdFieldTOC')
                w.Fields.Item(i).Update;
        end
end