clc
clear
close all

% Setup figures to be full screen
figure('units','normalized','outerposition',[0 0 1 1])
% Specify format style
format shortG
% Generate a 51 by 51 matrix uniformly distributed random number between 0
% and 1, since I use pcolor which does not show row 51 and column 51
Grid = rand(51);

% Create a variable to help limit the for loop, with intended grid size
grid_size = 50;

% Initialize each cell to 0 or 1
for i = 1:grid_size+1
    for j = 1:grid_size+1
        % Ensure we only adjust values within 50 x 50
        if i <= grid_size && j <= grid_size
            % if the value of the cell is greater than 0.49 it becomes 1
            if Grid(i,j) > 0.49
                Grid(i,j) = 1; % Blue
            else
            % if the value of the cell is less than or equal to 0.49 it becomes 0
                Grid(i,j) = 0;
            end
        else
            % Outside the 50 x 50 grid
            Grid(i,j) = 0;
        end
    end
end
% Create figure
figure(1)

for i = 1:35
    for row = 50:-1:2
        for col = 50:-1:2
         % 1 Blue
    
         sum = Grid(row,col) + Grid(row-1,col) + Grid(row+1,col) + Grid(row,col-1) + Grid(row,col+1);
    
             if sum >= 1 && Grid(row,col) == 0
                 temp = Grid(row,col);
                 Grid(row,col) =  Grid(row-1,col);
                 Grid(row-1,col) = temp;
             end
        end
        
        
    end
    % Create axes for surface
        ax1 = axes;
        
        % Create surface to show gird
        surface = pcolor(ax1,Grid);
        
        % Remove grid lines
        set(surface,'EdgeColor','none');
        
        % Set colormap
        mymap = [
            0.00 0.00 0.40 % BLUE
            0.00 0.40 0.40 % White
            ];
        colormap(mymap)
        
        % Limit everything to within the view of the grid
        xlim([1 50])
        ylim([1 50])
        pause(1)
end

