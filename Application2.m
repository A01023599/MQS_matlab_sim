%Raw data
kick_deaths = [5 9 14 13 14 16 7 7 8 2];
average = mean(kick_deaths);

max_deaths = 10;

%Probability of ten kick deaths in a year
%probability_max_deaths = poisson_prob(max_deaths, average);

%disp(probability_max_deaths)

probs = zeros(27);
for i = 1:27
    probs(i) = poisson_prob(max_deaths, i-1);
    %disp((i-1)+","+probs(i));
end

sum_up_to_ten = 0;
c = 0;
for i = 1:11
    sum_up_to_ten = sum_up_to_ten + probs(i);
    c = c + 1;
end


stairs(0:26, probs*100);
xlabel("Deaths per year")
ylabel("Probability (%)")
title("Probability of certain amounts of deaths by horse kick per year")
grid on
text(14, 11.5, "Probability of 10 or fewer: "+(100*sum_up_to_ten)+"%")
text(14, 10.5, "Probability of more than 10: "+(100*(1-sum_up_to_ten))+"%")
xline(10, 'r')

%FUNCTIONS
function prob = poisson_prob(k,L)
    prob = ((L^k)*exp(-L))/factorial(k);
end
