% Autor: Paulo Ricardo dos Santos Sousa
% Matrícula: 495757


% w-> vetor de pesos (vetor linha)
% n-> passo de aprendizagem
% d-> vetor de saida esperada
% y-> saida do perceptron
% x-> vetor de entradas
% e-> erro, tal que e=d-y
% w1,w2,w3,w4 são usadas para armazenar os pesos atualizados após cada
% entrada
clear all
clc


x=[-1 -1 -1 -1; 0 0 1 1; 0 1 0 1];
d=[0 1 1 1];
n=0.5;

%Gerando vetor de pesos aleatório
w=rand(1,3); %w(1)=bias
while 1
    % Aprendizagem para entrada [-1 0 0]'
    u=sum(x(:,1)'.*w);
    y=sign(u)>0;
    e=d(1)-y;
    w=learning(w,n,e,x(:,1)');
    w1=w;

    % Aprendizagem para entrada [-1 0 1]'
    u=sum(x(:,2)'.*w);
    y=sign(u)>0;
    e=d(2)-y;
    w=learning(w,n,e,x(:,2)');
    w2=w;

    % Aprendizagem para entrada [-1 1 0]'
    u=sum(x(:,3)'.*w);
    y=sign(u)>0;
    e=d(3)-y;
    w=learning(w,n,e,x(:,3)');
    w3=w;

    % Aprendizagem para entrada [-1 0 0]'
    u=sum(x(:,4)'.*w);
    y=sign(u)>0;
    e=d(4)-y;
    w=learning(w,n,e,x(:,4)');
    w4=w;
    
    % Critério de parada: os vetores de pesos para cada entrada devem ser
    % iguais, de modo que os pesos em cada entrada são comparad
    if w1==w2
        if w1==w3
            if w1==w4
                break;
            end
        end
    end
end
disp('Pesos: ');
w
    hold on
    x1=x(2,:); %x1=[0 0 1 1]
    x2=x(3,:); %x2=[0 1 0 1]
    scatter(x1,x2,'filled');
    xlabel('x1');
    ylabel('x2');
    x2=(-1)*(w(2)/w(3))*x1+w(1)/w(3);
    plot(x1,x2);
    grid on;
    title('Gráfico de Treinamento');
    hold off
 
%Regra de aprendizagem do Perceptron
function r = learning(w,n,e,x)
    r = w+n*e*x;
end