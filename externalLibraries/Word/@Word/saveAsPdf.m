function saveAsPdf(this,file)

w = this.wordHandle;
wdFormatPDF = 17;
w.SaveAs2(file,wdFormatPDF);
