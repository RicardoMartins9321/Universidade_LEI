clear all;

udata=load('u.data');
u= udata(1:end,1:2); 
clear udata;

users = unique(u(:,1));
Nu= length(users);

Set= cell(Nu,1); 

for n = 1:Nu 
    ind = find(u(:,1) == users(n));
    Set{n} = [Set{n} u(ind,2)];
end

tic;
J=zeros(Nu); % array para guardar distancias
for n1= 1:Nu
    for n2= n1+1:Nu
        J(n1,n2)=length(intersect(Set{n1},Set{n2}))/length(union(Set{n1},Set{n2}));  
    end
end
delete (h)
save("distances.mat","J");
fprintf("time to calculate distances: %7.6es\n",toc);

tic;
threshold =0.4; % limiar de decisão
% Array para guardar pares similares (user1, user2, distancia)
SimilarUsers= zeros(1,3); 
k= 1;
for n1= 1:Nu
    for n2= n1+1:Nu
        if J(n1,n2)<threshold
            SimilarUsers(k,:)= [users(n1) users(n2) J(n1,n2)];
            k= k+1;
        end
    end
end
delete (h);
fprintf("time to filter similar: %7.6es\n",toc);


% Nova parte do ex 4
SimilarUsers = sortrows(SimilarUsers,3);
K = 100;
assinaturas = inf(Nu, K);
tic;
for n = 1:Nu
    conjunto = Set{n};
    for i= 1:length(conjunto)
        chave= num2str(conjunto(i));
        h_out= muxDJB31MA(conjunto(i),127,K);
        assinaturas(n,:)= min(h_out, assinaturas(n,:));
    end
end

J=zeros(Nu); 
for n1= 1:Nu
    for n2= n1+1:Nu
        J(n1,n2) = sum(assinaturas(n1,:) ~= assinaturas(n2,:))/K;
    end
end
delete (h)
toc(t);


tic;
threshold =0.4; % limiar de decisão
SimilarUsers= zeros(1,3); 
k= 1;
for n1= 1:Nu
    for n2= n1+1:Nu
        if J(n1,n2)<threshold
            SimilarUsers(k,:)= [users(n1) users(n2) J(n1,n2)];
            k= k+1;
        end
    end
end
delete (h);
fprintf("time to filter similar: %7.6es\n",toc);


% funções a ser usadas para o MinHash
function BF = inicializer(n)
    BF = false(1,n);
end

function BF = adicionar(BF, chave, k)
    m = length(BF);
    aux = muxDJB31MA( chave, 127, k);
    for i = 1:k
        h= mod(aux(i),m) + 1;
        BF(h) = true;
    end
end

function out = pertence(BF, chave, k)
    m =lenght(BF);
    aux = muxDJB31MA( chave, 127, k);
    out = true;
    for i = 1:k
        h= mod(aux(i),m) + 1;
        if ~BF(h)
            out=false;
            break;
        end
    end
end

function aux = muxDJB31MA( chave, seed, k)
    len= length(chave);
    chave= double(chave);
    h= seed;
    for i = 1:len
        h = mod(31 * h + chave(i), 2^32 -1) ;
    end
    for i = 1:k
        h= mod(31 * h + i, 2^32 -1) ;
        aux(i) = h;
    end
end