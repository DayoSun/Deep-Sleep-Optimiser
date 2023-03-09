%% Fitness Function
function [z] = myFitn(x)
global matriz

[val,ind]=sort(x);

path=[ind ind(1)];
pathcost=0;
for ik=1:numel(path)-1
    pathcost=pathcost+matriz(path(ik),path(ik+1));
end
%
z=pathcost;


end
