function save_counts(infilename, data, not_outliers, nonblankidx)
    outfilename = strcat(infilename(1:end-5), '_new', infilename(end-4:end));
    
    write_header(infilename, outfilename);

    % retain baseline counts before and after main reading
    startidx = nonblankidx(1);
    endidx = nonblankidx(end);
    start_baseline = data(1:startidx-1, :);
    end_baseline = data(endidx-1:end, :);

    % append baseline data to filtered counts
    output_data = [start_baseline; data(not_outliers, :); end_baseline];
    
    % append to file
    dlmwrite(outfilename, output_data, '-append', 'precision', 16);
end
