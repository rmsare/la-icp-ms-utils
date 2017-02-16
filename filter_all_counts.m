function filter_all_counts(directory)
    filelist = dir(directory);
    
    for(i=1:numel(filelist))
        infilename = filelist(i).name;
        if(numel(infilename) > 2 && strcmp(infilename(end-3:end), 'FIN2'))
            infilename = strcat(directory, infilename);
            
            % eventuall replace with function for finding active readings (not background)
            %nonblankidx = find_analysis_times(data); 
            % take indices as user input for now
            nonblankidx = 143:290; % change this for different analysis times
            
            [data, k] = read_counts(infilename, nonblankidx);
            not_outliers = outlier_test(data, nonblankidx, 3, 0, k);
            save_counts(infilename, data, not_outliers, nonblankidx);
        end
    end
end
