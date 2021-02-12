%Changement de rep�re entre les rep�res du capteur et de la plateforme
%Pr� manip BAHAMaS
%center --> origine 

function [TC2] = ChgmtReperesCapteurPlateforme(T21,center)
phi = (45*pi)/180; %D'apr�s les donn�es du constructeur
nbframes = size(center,1);
TC2 = zeros(4,4,nbframes);
for i = 1:nbframes
    X_capteur = cos(phi)*[1 0 0]+sin(phi)*[0 1 0];
    X_capteur = X_capteur/norm(X_capteur);
    Y_capteur = -sin(phi)*[1 0 0]+cos(phi)*[0 1 0];
    Y_capteur = Y_capteur/norm(Y_capteur);
    Z_capteur = [0 0 1];
    R2C = [X_capteur' Y_capteur' Z_capteur'];
    T12 = inv(T21(:,:,i));
    %Center et TC2 exprim�es dans le rep�re monde
    %Diff�rence des deux donne l'origine de capteur dans 2 mais exprim�e dans le rep�re 2
    %On la multiplie par R12 pour l'avoir dans le rep�re 2
    %T2C est donc bien exprim�e dans le rep�re 2
    T2C = [R2C T21(1:3,1:3,i)*(center(i,:)'-T12(1:3,end)); 0 0 0 1];
    TC2(:,:,i) = inv(T2C);
end