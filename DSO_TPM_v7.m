%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DEEP SLEEP OPTIMIZATION (DSO).                                                           %
% Authors: Stephen Ekwe and Sunday Oladejo                                                  %
% Version: v2 - TWO PROCESS MODEL (TPM) APPROACH                                            %
% Last Update: 2021-10-15                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Best] = DSO_TPM_v7(ObjFun,LB,UB,dim,search_agent,run)
%% Problem Parameters
prob = ObjFun;                  % objective function
nVar = dim;                     % dimension of problem
lb = LB;                        % lower bound
ub = UB;                        % upper bound
nPop = search_agent;            % no. of search agent
MaxIt = run;                    % no. of individual runs

%% DSO Tuning Parameters
H0_minus = 0.17;                % mininum inital homeostatic value of search space
H0_plus = 0.85;                 % maxinum inital homeostatic value of search space
a = 0.1;                        % circadian cost per unit fuction
xs = 4.2;                       % sleep power index
xw = 18.2;                      % wake power index
T = 24;                         % maximum sleep duration of agent

%% Pre-allocate
fit = zeros(nPop,1);                    % vector to store fitness value
Best.iteration = zeros(MaxIt+1,1);      % vetcor to store best fitness value per iteration

%% Starting Deep Sleep Optimization
C = sin((2*pi)/T);                      % set the periodic function
H_min = H0_minus + a.*C;                % set homeostatic lower threshold
H_max = H0_plus + a.*C;                 % set homeostatic upper threshold

Pop = repmat(lb,nPop,1) + repmat((ub-lb),nPop,1).*rand(nPop,nVar); % generate initial population of search agents

%% Evaluate fitness
for q = 1:nPop
    fit(q) = prob(Pop(q,:));            % evaluating the fitness value of the initial solution
end
Best.iteration(1) = min(fit);           % stores the best fitness value of the 0th iteration


%% Main Loop
for i = 1:MaxIt
    for j = 1:nPop
        % Get initial population for 2D plot
        if (i==1) && (j==round(nPop*0.1))
            int_pop.one = Pop;
        elseif (i==1) && (j==round(nPop*0.5))
            int_pop.Fone = Pop;
        elseif (i==2) && (j==round(nPop*0.1))
            int_pop.two = Pop;
        elseif (i==3) && (j==round(nPop*0.2))
            int_pop.three = Pop;
        elseif (i==4) && (j==round(nPop*0.5))
            int_pop.four = Pop;
        elseif (i==5) && (j==round(nPop*0.8))
            int_pop.five = Pop;
        elseif (i==MaxIt) && (j==nPop*1)
            int_pop.last = Pop;
        end   
        
        Xini = (Pop(j,:));              % obtain initial solution of agent
        [~,ind] = min(fit);             % determine the position of agent with best fitness
        Xbest = Pop(ind,:);             % obtain initial best solution 
        
        mu = rand;                      % randomly select asymptote value
        mu = min(H_max,mu);             % bound violating asymptote to upper bound
        mu = max(H_min,mu);             % bound violating asymptote to lower bound
        
        H0 =  Pop(j,:) + rand(1,nVar).*(Xbest - mu.*Xini); % obtain candidate solution
        
        % randomly compute candidate solution based on Sleep-Wake cycle
        if (rand > mu) 
            H = H0.*10^(-1/xs);             % exploit agent position as homeostatic pressure decreases during sleep
        else
            H = mu + (H0-mu).*10^(-1/xw);   % explore other positions as homeostatic pressure increases during wake 
        end
        
        H = min(ub,H);              % bound violating variables to their upper bound
        H = max(lb,H);              % bound violating variables to their lower bound
        
        fnew = prob(H);             % evaluating the fitness of new candidate solution
        if (fnew < fit(j))          % greedy selection
            Pop(j,:) = H;           % include the new solution in population
            fit(j) = fnew;          % include the new fitness to fitness function of population
        end
    end
    Best.iteration(i+1) = min(fit); % store best fitness per iteration
end
% DSO-TPM Solution: Global best value and position
[Best.Cost,ind] = min(fit); Best.Position = Pop(ind,:);
end

