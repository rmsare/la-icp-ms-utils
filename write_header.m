function write_header(infilename, outfilename)    
    infid = fopen(infilename, 'r');
    outfid = fopen(outfilename, 'wt');

    line = textscan(infid, '%s %s %s %s %s', 1);
    for(string=line)
        fwrite(outfid, cell2mat(string{1}));
        fwrite(outfid, ' ');
    end
    fprintf(outfid, '\n');
    
    line = textscan(infid, '%s %s %s %s %s', 1);
    for(string=line)
        fwrite(outfid, cell2mat(string{1}));
        fwrite(outfid, ' ');
    end
    fprintf(outfid, '\n');

    line = textscan(infid, '%s', 1);
    fwrite(outfid, cell2mat(line{1}));
    fprintf(outfid, '\n');

    line = textscan(infid, '%s', 1);
    fwrite(outfid, cell2mat(line{1}));
    fprintf(outfid, '\n');
    
    line = textscan(infid, '%s', 1);
    fwrite(outfid, cell2mat(line{1}));
    fprintf(outfid, '\n');
    
    line = textscan(infid, '%s', 1);
    fwrite(outfid, cell2mat(line{1}));
    fprintf(outfid, '\n');
    
    line = textscan(infid, '%s', 1);
    fwrite(outfid, cell2mat(line{1}));
    fprintf(outfid, '\n');
    
    line = textscan(infid, '%s', 1);
    fwrite(outfid, cell2mat(line{1}));
    fprintf(outfid, '\n');
    
    fclose(infid);
    fclose(outfid);
end
