	.data
prompt1:.asciiz "Introduza um numero: "
par:	.asciiz "O numero e par\n"
impar:	.asciiz "O numero e impar\n"

	.text
	
main:
		li $v0, 4		# $v0 = 4 (syscall "print_str")
		la $a0, prompt1 	# Apresenta o prompt 
		syscall
	
		li $v0, 5		# $v0 = 5 (syscall "read_int")
		syscall			# Pede um numero ao utilizador
		move $t0, $v0		# $t0 = num
					
		andi $t1, $t0, 1	# $t1 = num and 1, sendo a representa��o em bits de 1 igual a 0x00...0001
					# sendo que o num tem uma representa��o 0xnn...nnn1 caso seja impar
					# pois a soma de qualquer numero par com o imapar 1 vai dar numero impar
					# por isso ao verficarmos a condica�ao (num and 1) caso seja impar vai manter o 1 no inicio
					# e por isso sabemos que � impar, enquanto se tiver 0 na representa�ao vai continuar a ter 
					# 0 no final da sua express�o e por isso sabemos que � par, pois a soma de par d� par
					
					# sendo que o num tem uma representa��o 0xnn...nnn0 caso seja par
					# pois a soma de qualquer numero par com o par d� numero par

		bne $t1, $0, imparloop 	# if ($t1!=0) goto imparloop
	
		li $v0, 4
		la $a0, par
		syscall
		j end
	
imparloop:	li $v0, 4		# $v0 = 4 (syscall "print_str")
		la $a0, impar
		syscall
end:
