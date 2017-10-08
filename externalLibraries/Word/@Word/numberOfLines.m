function nLines = numberOfLines( this )

nLines = this.actxWord.Selection.Range.ComputeStatistics(1);