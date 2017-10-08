x = (0:0.1:5);
y = sin(x);

% figure('Visible','off')
% a = plot(x,y);
% savefig('Funcion.fig')
% 

figure
subplot(2,1,1);
plot([2 3],[ 2 2],'b');
hold on
plot([3 4],[3 3],'b');
hold on
plot([4 5],[ 4 4],'b');