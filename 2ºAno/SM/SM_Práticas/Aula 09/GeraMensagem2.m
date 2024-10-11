function [NumBits,NumBPS] = GeraMensagem2(f,CompMesg,nBits)

    Mesg = randsample(1:length(f), CompMesg, true, f/sum(f));
    N = length(f);
    NumBits = 0;
    
    for n=1:N
        NumBits = NumBits + sum(Mesg == n)*nBits(n);
    end
    
    NumBPS = NumBits / CompMesg;