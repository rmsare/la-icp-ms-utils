function filter_all_counts(directory)
    filelist = dir(directory);
    
    for(i=3:numel(filelist))
        infilename = filelist(i).name;
        if(strcmp(infilename(end-3:end), 'FIN2'))
            infilename = strcat(directory, infilename);
            nonblankidx = 143:290;
            [data, k] = read_counts(infilename, nonblankidx);
            not_outliers = outlier_test(data, nonblankidx, 3, 0, k);
            save_counts(infilename, data, not_outliers, nonblankidx);
        end
    end
end