function save_counts(infilename, data, not_outliers, nonblankidx)
    outfilename = strcat(infilename(1:end-5), '_new', infilename(end-4:end));
    
    infid = fopen(infilename, 'r');
    outfid = fopen(outfilename, 'wt');

    % retain baseline counts before and after main reading
    startidx = nonblankidx(1);
    endidx = nonblankidx(end);
    start_baseline = data(1:startidx-1, :);
    end_baseline = data(endidx-1:end, :);

    % append baseline data to filtered counts
    output_data = [start_baseline; data(not_outliers, :); end_baseline];

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
   
    
    dlmwrite(outfilename, output_data, '-append', 'precision', 16);
end
