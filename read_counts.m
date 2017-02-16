function [data, k] = read_counts(filename)
    data = csvread(filename, 8, 0);
    t = data(:,1);
    names = {'Time','Hg201','Hg202','Pb204','Pb206','Pb207','Pb208'};
    
    % close all
    k = figure; % to show all
    % figure(1) %to show last
    subplot(3,2,1)
    hold on
    for(i=1:6)
        figure(k)
        subplot(3,2,i)
        plot(t, data(:, i+1), 'k-')
        ylabel(names(i+1))
        xlabel('time')
    end

end
