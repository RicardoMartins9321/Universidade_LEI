%% Ex 3.1.3 a)
% inicializar um array de zeros para a matriz transição 20x20
T = zeros(20,20);

% como só queremos os valores para os quais a matriz T seja estocástica
% vamos ter de verificar se no final a sua soma é igual a 1, caso seja
% substituimos em T pelo valor de 
for k = 1 : 20
  % gerar uma matriz de 20x1 de random numbers
  r = rand(20, 1);
  % ao dividir todos os valores de r pelo valor da sua soma garantimos que
  % agora a soma dos valores de r vão igualar a 1
  r = r / sum(r);
  
  T(:,k) = r;
end 

disp(T);
disp("É estocástica pois não temos entradas negativas e a soma de cada coluna dá sempre 1");



%% Ex 3.1.3 b)
T = zeros(20,20);

for k = 1 : 20
  r = rand(20, 1);
  r = r / sum(r);
  
  T(:,k) = r;
end 

% Calcular as probabilidades de estar no estado 20 após um número específico de transições
% Converter as probabilidades em porcentagem com 5 casas decimais
x0 = zeros(1,20)';
x0(1) = 1;

prob_2_transicoes = (T^2)*x0;
prob_2_transicoes_percentagem = prob_2_transicoes(20)*100

prob_5_transicoes = (T^5)*x0;
prob_5_transicoes_percentagem = prob_5_transicoes(20)*100

prob_10_transicoes = (T^10)*x0;
prob_10_transicoes_percentagem = prob_10_transicoes(20)*100

prob_100_transicoes = (T^100)*x0;
prob_100_transicoes_percentagem = prob_100_transicoes(20)*100

% Mostrar os resultados
fprintf('Probabilidade após 2 transições: %.5f%%\n', prob_2_transicoes_percentagem);
fprintf('Probabilidade após 5 transições: %.5f%%\n', prob_5_transicoes_percentagem);
fprintf('Probabilidade após 10 transições: %.5f%%\n', prob_10_transicoes_percentagem);
fprintf('Probabilidade após 100 transições: %.5f%%\n', prob_100_transicoes_percentagem);
