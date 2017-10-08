function n = numberOfSelectedPages( this )
	n = this.actxWord.Selection.Information(4);
end