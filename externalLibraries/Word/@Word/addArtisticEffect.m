function addArtisticEffect( this, effect )
%Ex: addArtisticEffect( w, 'msoEffectPhotocopy' );

shapes = this.actxWord.Selection.InlineShapes;
ns = shapes.Count;
for i=1:ns
    pic = shapes.Item(i);
    type = pic.Type;
    if ~any(strcmpi(type,{'wdInlineShapeLinkedPicture','wdInlineShapePicture'}))
        continue;
    end
    pic.Fill.PictureEffects.Insert(effect);
end
