	.data
array:	.word 7692, 23, 5, 234 #int array[] = {7693, 23, 5, 234

	.text
	.globl main
	
main:

	li	$t3, 0		#int soma = 0
	la	$t0, array	#endere�o inicial
	li	$t1, 0		#i = 0
	
for:	sll	$t4, $t1, 2	#$t5 = $t4 (i) << 2 <=> i*4 -> endere�os multiplos de 4
	add	$t5, $t4, $t0	#endere�o atual = endere�o inicial + i*4

	bgt	$t1, 3, endfor	#for (i <= 3)
	
	lw	$t2, 0($t5)	#str[i] = array[$t5]
	add	$t3, $t3, $t2	#soma = soma + (p[i])	
	addi	$t1, $t1, 1	#i++
	
	j	for		#jump to label while

endfor:
	move	$a0, $t3	#move content of $t3 to functiona arguments
	li	$v0, 1		#load print_int instruction
	syscall			#execute
	
	jr	$ra		#end
