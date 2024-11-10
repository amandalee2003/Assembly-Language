
#Note that this file only contains a function xyCoordinatesToAddress
#As such, this function should work independent of any caller funmction which calls it
#When using regisetrs, you HAVE to make sure they follow the register usage convention in RISC-V as discussed in lectures.
#Else, your function can potentially fail when used by the autograder and in such a context, you will receive a 0 score for this part

xyCoordinatesToAddress:
	#(x,y) in (a0,a1) arguments
	#a2 argument contains base address
	#returns pixel address in a0
	
	#make sure to return to calling function after putting correct value in a0!
	#Enter code below!DO NOT MODIFY ANYTHING BEFORE THIS COMMENT LINE!
	
	#thought process:
	#I used the piazza lab 4 notes for reference
	#This code was hard to understand at first, but I knew that the code somehow took two variables (a0 and a1)
	#With that, the coordinates are used to return the pixel address from the base address
	
	#pseudo code:
	#Since the mult function is complicated, it was recommended to use slli
	#x equals a0
	#Equal a0 to a0 times 2 to the power of 2 (4)
	#This is because every time x moves one to the right, you add 4 bits to it, therefore you multiply the value of x to 4
	#y equals a1
	#Equal a1 to a1 times 2 to the power of 7 (128)
	#This is because every time y moves one down once, you have to go through all 32 spaces of x first which all equal 4 bits 
	#Therefore you multiply the value of y to 32 times 4 which is 128
	#a2 equals the base address
	#Add the x value to the base address
	#Add the y value to the base address to create the pixel address
	#Now have a0 equal a2 by adding it to zero
	#return the value of the pixel address
	
	slli a0,a0,2 #a0 equals a0 times 2 to the power of 2 (4)
	slli a1,a1,7 #a1 equals a1 times 2 to the power of 7 (128)
	add a2,a2,a0 #a2 (base address) equals a2 plus x
	add a2,a2,a1 #a2 (base address) equals a2 plus y
	add a0,zero,a2 #Have a0 equal a2
	ret #return
				
