function matriz = distance(inputcities)
% DISTANCE
% d = DISTANCE(inputcities) calculates the distance between n cities as
% required in a Traveling Salesman Problem. The input argument has two rows
% and n columns, where n is the number of cities and each column represent
% the coordinate of the corresponding city.

% d = 0;
% for n = 1 : length(inputcities)
%     if n == length(inputcities)
%         d = d + norm(inputcities(:,n) - inputcities(:,1));
%     else
%         d = d + norm(inputcities(:,n) - inputcities(:,n+1));
%     end
% end

for i2=1:length(inputcities)
    for j = 1:length(inputcities)

        distance = sqrt((inputcities(1,i2) - inputcities(1,j))^2 + (inputcities(2,i2) - inputcities(2,j))^2);

        %         if (distance <= R )
        %             %line([X(i2) X(j)], [Y(i2) Y(j)], 'LineStyle', '-.');
        matriz(i2,j)=distance;
        %G1(i2,j)=1;
        %         else
        %             matriz(i2,j)=distance;
        %             G1(i2,j)=0;
        %         end

    end
end
