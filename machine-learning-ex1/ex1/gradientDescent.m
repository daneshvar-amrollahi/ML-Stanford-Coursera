function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

delta = zeros(2, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    sum = 0;
    for i = 1:m
        sum = sum + ((theta(1) * X(i, 1) + theta(2) * X(i, 2)) - y(i)) * X(i, 1);     
    endfor
    
    delta(1) = (1 / m) * sum;
    
    sum = 0;
    for i = 1:m
        sum = sum + ((theta(1) * X(i, 1) + theta(2) * X(i, 2)) - y(i)) * X(i, 2);
    endfor
    
    delta(2) = (1 / m) * sum;
    
    theta = theta - alpha * delta;


    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
