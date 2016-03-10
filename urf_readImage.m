function X = read_image(filename)
   function X = read_image(filename)
        %Lê uma imagem inserida e a transforma em um vetor 
	X = [];
	try
		X = double(imread(filename)); %Pega a imagem e transforma em números 
		[height width channels] = size(X); %Usa a altura, largura e quantidade de cor como elementos do vetor
		% se tiver 3 canais de cores (figurada colorida), transforma a figura em escala de cinza
		if(channels == 3)
			X = (X(:,:,1) + X(:,:,2) + X(:,:,3)) / 3;
		end
		X = reshape(X,width*height,1);

        %captura um possível erro na recepção da imagem e mostra uma mensagem com o nome do erro    
	catch 
		lerr = lasterror; 
		fprintf(1,'Cannot read image %s.\nReason:\n%s\n', filename, lerr);
	end
en
end
