		.eqv		SIZE, 3
		.data
str0: 		.asciiz		"Array"
str1:		.asciiz		"de"
str2:		.asciiz		"Ponteiros"
		.align 2
array:		.word		str0, str1, str2	#array de ponteiros -> em cada indice tem o base address da string
						
						#ACESSO POR INDICES
						#� necess�rio obter o base_address do array
						#� necess�rio calcular o "offset" necess�rio ao base address (s� no acesso por indices)
						#obter o endere�o de memoria para o elemento do vetor que qeuremos
						#o lw desse endere�o d� nos o base_address do vetor que a� esta!

		.text
		.globl main
		
main:		la	$t0, array
		
		li	$t1, 0			#i = 0
		
		#for (i = 0; i < SIZE ; i++)
for0:		bge	$t1, SIZE, endfor0	# i < SIZE

		sll	$t2, $t1, 2		#idx = i * 4
		addu	$t2, $t2, $t0		#idx = base_address + i*4
						#O idx � o endere�o para o ponteiro da string!!!!
		
		
		lw	$a0, 0($t2)		#print_str(array[i])
 		li	$v0, 4			#Carregar para o $a0 o valor do primeiro elemento do array <=> endere�o da 1� string
		syscall
		
		li	$a0, '\n'		#print_char('\n') -> mudar de linha
		li	$v0, 11
		syscall
		
		addiu	$t1, $t1, 1		#i++
		
		j	for0
		
endfor0:	jr	$ra
		  	
