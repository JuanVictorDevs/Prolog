%definindo parentesco de pais e maes.
pai(gabriel, leticia).
pai(gabriel, jessica).
pai(edinaldo, anderson).
pai(edinaldo,danilo).
pai(paulo, andre).
pai(juan, annie).
pai(juan, roberto).
pai(anderson, paulo).
pai(anderson, vitor).
pai(jhonata, jorge).
pai(jhonata, pedro).
pai(jorge, beatriz).
pai(jorge, francisco).
pai(paulo, marcos).
pai(vitor, gabrielly).
pai(vitor, fred).
pai(francisco, bernado).
pai(francisco, larissa).
mae(joana, leticia).
mae(joana, jessica).
mae(patricia, bernado).
mae(patricia,larissa).
mae(rogeria, anderson).
mae(rogeria, danilo).
mae(rita, annie).
mae(rita, roberto).
mae(erina, jorge).
mae(erina, pedro).
mae(leticia, paulo).
mae(leticia, vitor).
mae(annie, beatriz).
mae(annie, francisco).
mae(sophia, andre).
mae(sophia, marcos).
mae(beatriz, gabrielly).
mae(beatriz, fred). %28
%definindo avós maternos.
avo_f(X,Y):- mae(X,Z),mae(Z,Y).
avo_f(X,Y):- mae(X,Z),pai(Z,Y).
%definindo avos paternos.
avo_m(X,Y):- pai(X,Z),mae(Z,Y).
avo_m(X,Y):- pai(X,Z),pai(Z,Y).
%definindo bisas.
bisavo_m(X,Y):- (avo_m(X,Z)),(pai(Z,Y);mae(Z,Y)).
bisavo_f(X,Y):- (avo_f(X,Z)),(pai(Z,Y);mae(Z,Y)). %34
%definindo sexualidade.
masculino(X):- pai(X,_).
masculino(roberto).
masculino(pedro).
masculino(danilo).
masculino(fred).
masculino(marcos).
masculino(andre).
masculino(bernado).
feminino(X):- mae(X,_).
feminino(gabrielly).
feminino(larissa).
feminino(jessica).
%definindo filhos.
filho(X,Y):- (pai(Y,X),mae(Y,X)),masculino(X).
filha(X,Y):- (pai(Y,X),mae(Y,X)),feminino(X).
%definindo irmaos.
irmao(X,Y):- (pai(W,X),pai(W,Y)),(mae(Z,X),mae(Z,Y)),masculino(X).
irma(X,Y):- (pai(W,X),pai(W,Y)),(mae(Z,X),mae(Z,Y)),feminino(X).
%definindo tia(o).
tia(X,Y):- (irmao(X,Z);irma(X,Z)),(filho(Y,Z);filha(Y,Z)).
tio(X,Y):- (irmao(X,Z);irma(X,Z)),(filho(Y,Z);filha(Y,Z)).