clear; 
close all;

% Calls my_ga to calculate
% Number of parameters to solve the problem 10
% Custom fitness function name my_fitness
% Population size 100
% The number that remains constant in each generation is 50 (ie the crossover rate is 0.5)
% Mutation probability 0.1 (1/10 of the individuals have mutations)
% Maximum evolution algebra 10000 10000 generations
% Minimum target value 1.0e-6 Individual fitness function value <0.000001
[best_fitness, elite, generation, last_generation] = my_ga ( 10 , ' my_fitness ' , 100 , 50 , 0.1 , 10000 , 1.0e-6 );


% 10 lines after output
% disp (best_fitness (9990: 10000, :));
% disp (elite (9990: 10000, :))
% This is inappropriate because GA often breaks out of the loop in the middle

% This is the appropriate output
disp (last_generation); 
i_begin = last_generation -  9 ;
disp (best_fitness (i_begin: last_generation, :));
% Convert the elite value into the problem range
my_elite = elite (i_begin: last_generation, :);
my_elite = 2  * (my_elite -  0.5 );
disp (my_elite);

% Evolution of the best fitness
figure
loglog ( 1 : generation, best_fitness ( 1 : generation), ' linewidth ' , 2 )
xlabel ( ' Generation ' , ' fontsize ' , 15 );
ylabel ( ' Best Fitness ' , ' fontsize ' , 15 );
set (gca, ' fontsize ' , 15 , ' ticklength ' , get (gca, ' ticklength ' ) * 2 );

% Evolution of the optimal solution
figure
semilogx ( 1  : generation, 2  * elite ( 1  : generation, :) -  1 )
xlabel ( ' Generation ' , ' fontsize ' , 15 );
ylabel ( ' Best Solution ' , ' fontsize ' , 15 );
set (gca, ' fontsize ' , 15 , ' ticklength ' , get (gca, ' ticklength ' ) * 2 );