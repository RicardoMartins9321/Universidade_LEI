% função que dá as probabilidades teoricas de em n experiencias acontecerem
% k situações tendo em conta a probabilidade p de estes acontecerem

function p = prob_teorica(k,n,p)

p = nchoosek(n,k)*p^k*(1-p)^(n-k); 

end