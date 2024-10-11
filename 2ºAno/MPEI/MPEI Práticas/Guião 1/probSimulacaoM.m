function [prob] = probSimulacaoM(p,n,c,N)

    lancamentos = rand(n,N) < p;
    sucessos = sum(lancamentos)<=c;
    prob = sum(sucessos)/N;

end