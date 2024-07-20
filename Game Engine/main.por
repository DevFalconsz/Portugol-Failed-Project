programa
{
	inclua biblioteca Util --> util
	inclua biblioteca Teclado --> tec
	inclua biblioteca Graficos --> graphic
	inclua biblioteca Mouse --> mouse

	inteiro cor_cinza = graphic.criar_cor(114, 118, 125)
	inteiro cor_preta = graphic.COR_PRETO
	inteiro cor_branca = graphic.COR_BRANCO

	inteiro person_idle = graphic.carregar_imagem("Person/idle.png")
	inteiro person_walk_left1 = graphic.carregar_imagem("Person/walkingLEFT.png")
	inteiro person_walk_left2 = graphic.carregar_imagem("Person/walkingLEFT2.png")
	inteiro person_walk_right1 = graphic.carregar_imagem("Person/walkingRIGHT.png")
	inteiro person_walk_right2 = graphic.carregar_imagem("Person/walkingRIGHT2.png")
	inteiro floor = graphic.carregar_imagem("floor.png")

	inteiro x = 100
	inteiro largura_janela
    	inteiro altura_janela

	inteiro frame = 0
	inteiro person = person_idle

	logico andando_direita = falso
	logico andando_esquerda = falso

	logico modo_tela_cheia = falso

	logico tecla_direita
	logico tecla_esquerda

	funcao personagem(){
		inteiro person_redimensionado = graphic.redimensionar_imagem(person, 100, 0, verdadeiro)
		
		graphic.desenhar_imagem(x, 100, person_redimensionado)

		tecla_direita = tec.tecla_pressionada(tec.TECLA_D)
		tecla_esquerda = tec.tecla_pressionada(tec.TECLA_A)

		se (tecla_direita){
			x += 6
			andando_direita = verdadeiro
			andando_esquerda = falso
			alternar_frame()
		}
		senao se (tecla_esquerda){
			x -= 6
			andando_esquerda = verdadeiro
			andando_direita = falso
			alternar_frame()
		}
		senao {
			andando_direita = falso
			andando_esquerda = falso
			person = person_idle
		}
	}

	funcao alternar_frame(){
		frame = (frame + 1) % 2
		se (andando_direita){
			se (frame == 0){
				person = person_walk_right1
			}
			senao {
				person = person_walk_right2
			}
		}
		se (andando_esquerda){
			se (frame == 0){
				person = person_walk_left1
			}
			senao {
				person = person_walk_left2
			}
		}
	}

	funcao desenhar_ambiente_grafico(){
		graphic.iniciar_modo_grafico(verdadeiro)
		graphic.definir_titulo_janela("Super Mario Bros")
		graphic.definir_dimensoes_janela(1024, 600)

		enquanto (verdadeiro){
			se (tec.tecla_pressionada(27)){
				modo_tela_cheia = nao modo_tela_cheia
               	se (modo_tela_cheia){
               		graphic.entrar_modo_tela_cheia()
               	}
               	senao{
               		graphic.sair_modo_tela_cheia()
               	}
			}

			graphic.definir_cor(cor_preta)
			graphic.limpar()
			largura_janela = graphic.largura_janela()
			altura_janela = graphic.altura_janela()

			personagem()

			inteiro floor_redimensionado = graphic.redimensionar_imagem(floor, largura_janela, 0, verdadeiro)

			// Desenhar o chão
			graphic.desenhar_imagem(0, altura_janela - (altura_janela / 20), floor_redimensionado)
			
			graphic.renderizar()
			util.aguarde(25) // Ajustar para controlar a velocidade da animação
		}

		graphic.encerrar_modo_grafico()
    }

	funcao inicio(){
		desenhar_ambiente_grafico()
    }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1091; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */