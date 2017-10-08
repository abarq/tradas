function updateFields(this)

w = this.wordHandle;

for i=1:w.Fields.Count
        w.Fields.Item(i).Update;
end

for i=1:w.StoryRanges.Item(1).Fields.Count
        w.StoryRanges.Item(1).Fields.Item(i).Update;
end
