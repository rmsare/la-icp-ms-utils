function not_outliers = outlier_test(data, nonblankidx, n, i, k)
    if(i == 0) % placeholder for testing against sum of all counts
        count = sum(data(:, 5:7), 2);
    else
        count = data(:,i);
    end
    
    t = data(nonblankidx, 1);
    count = count(nonblankidx, :); % test only against non-blank section of scan
    med = median(count);
    q1 = prctile(count, 25);
    q3 = prctile(count, 75);
    rng = q3 - q1;
    
    not_outliers = find((count >= q1 - (n/2)*rng) & (count <= q3 + (n/2)*rng));
    
    if(i ~= 0)
        figure(k)
        subplot(3,2,i-1)
        hold on
        plot(t, count, 'b+')
        plot(t(not_outliers), count(not_outliers), 'r+')
    else
        figure
        hold on
        plot(t, count, 'b+')
        plot(t(not_outliers), count(not_outliers), 'r+')
        xlabel('time')
        ylabel('Total counts')
    end
    
    not_outliers = not_outliers + nanmin(nonblankidx); % transform to indices for main data vector
end
