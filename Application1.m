% Raw data
tickets_received = [50 10 4 5 19 23 4 12 37 35 38 60 17 12 25 34 45 70];
average = mean(tickets_received);

desired_ammount = 20;

%Probability of exactly desired_amount
probability_desired = poisson_prob(desired_ammount, average);

disp("Probability of "+desired_ammount+" in any hour is: "+probability_desired)

%Probability of desired_amount or fewer
total = 0;
for i = 0:1:20
    total = total + poisson_prob(i,average);
end

disp("Probability of "+desired_ammount+" or fewer tickets in any hour is: "+total)


%for each = [15 16 17 18 19 20]
    %probabilities poisson_prob(tickets_received, average)
%    poisson_prob(each, average)
%end


function prob = poisson_prob(k,L)
    prob = ((L.^k)*exp(-L))/factorial(k);
end
