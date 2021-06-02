% Raw data
tickets_received = [50 10 4 5 19 23 4 12 37 35 38 60 17 12 25 34 45 70];
average = mean(tickets_received);

desired_ammount = 20;

%Probability of exactly desired_amount
probability_desired = poisson_prob(desired_ammount, average);

%disp("Probability of "+desired_ammount+" in any hour is: "+probability_desired)

%Probability of desired_amount or fewer
probabilities = zeros(desired_ammount,1);
for i = 0:1:desired_ammount
    probabilities(i+1) = poisson_prob(i,average);
end

%disp("Probability of "+desired_ammount+" or fewer tickets in any hour is: "+sum(probabilities))

%PLOTTING
stairs(0:desired_ammount,probabilities*100)
xlabel('Amount of tickets')
ylabel('Probability (%)')
title('Probabilities of n tickets arriving during any one hour period')
grid on
text(2, 2.4, "Probability of "+desired_ammount+" in any hour is: "+(probability_desired*100)+"%") 
text(2, 2.2, "Probability of "+desired_ammount+" or fewer tickets in any hour is: "+(100*sum(probabilities))+"%")

%FUNCTIONS
function prob = poisson_prob(k,L)
    prob = ((L^k)*exp(-L))/factorial(k);
end
