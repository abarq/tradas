filecontent = fileread('prueba.txt');
newcontent = regexprep(filecontent, {'\r', '\n\n+', '\n'}, {'', '\n', '\r\n'});
fid = fopen('prueba3.txt', 'w');
fwrite(fid, newcontent);
fclose(fid);