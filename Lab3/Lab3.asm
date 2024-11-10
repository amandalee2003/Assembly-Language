##########################################################################
# Created by: Lee, Amanda
#	      Ammolee
#	      09 May 2022
#
# Assignment: Lab 3: Looping in RISC-V Assembly
#	      CMPE 012, Computer Systems and Assembly Language
#	      UC Santa Cruz, Spring 2022
#
# Description: This programs objective is to ask for a user input and (if over 0) to execute the program and print out the corresponding number in lines
#              counting up in order from 1 (odd numbers only) with * and $ alternating to fulfill the needed amount of characters per line.
#
# Notes: This program is intended to be run from the RARS RISC-V.
##########################################################################


#pseudocode:
#.macro
#Define 3 .macros
#One macro should be able to be called in order to exit the code
#The other macro needs to be able to be called in order to print a given string
#The last maco should be able to print a given integer
#
#.data
#Now under the .data section, define the strings needed in the code
#Code a prompt input message, new line, invalid entry, money, and asterisk character to be called 
#
#.text
#Starting in the .text section
#The main section will start by assigning some registers
#This is also where the input message will be called to print
#The input will be assigned to a variable/register
#If t1 is less than 1, then jump to the errorPrint and follow steps
#Jump to branch errorPrint if it fits the criteria
#For the previous if statement, if the input is invalid, then we code an errorPrint
#Error print will announce the input is not valid, print a new line, and repeat the user input original prompt
#The code will reassign the new input to the same register as before and recheck if it fits, and then proceed from there as needed
#If the code works, a validEntry step is needed
#This will simply get the loops set up by assigning variables to the needed numbers/loop counters
#The outer loop (loop) will now start
#The only code will to be to check if t2 is greater than or equal to t1, and if so, then proceed to loop_exit
#Now the start of the two inner loops 
#For the first one (nestedInnerOne), print the $ character everytime it loops through and add 1 to t4
#Check to see if t4 is greater than or less than t3, and if so, proceed to endingLoop
#For the second for loop (nestedInnerTwo), print the * character everytime it loops through and add 1 to t4
#Check to see if t4 is greater than or less than t3, and if so, proceed to endingLoop
#Lastly, jump to the nestedInnerOne loop to make sure the characters end in a $
#The inner loop is now completed, and time to finish up the outer loop
#The last step for the loop is to print out the integer t3 which are the odd numbers starting from one that corresponds with the user input
#Ending with printing a new line
#The loop update will finalize everything by adding a 2 to t3 (allows the number to skip to odd number only)for the outcome
#Also adding 1 to t2 as a counter
#Defining t4 as zero
#As well as jumping back to loop after loop_update is finished 
#The last thing to do is exit the code (loop_exit)
#Now the code should print as it's supposed to with all the correct spacing and grammer
#End of pseudocode


#copied down the macros from multiply since they are very useful for this lab, but changed the comments
.macro exit #this macro defines exit as a variable to call 
		li a7, 10
		ecall #system ecall
		.end_macro	

.macro print_str(%string1) #this macro allows a string to be printed after its defined
	li a7,4 
	la a0, %string1
	ecall #system call
	.end_macro
	
.macro print_int (%x)  #this macro allows an integer to be printed after its defined
	li a7, 1
	add a0, zero, %x
	#zero is equaling a register named #0
	ecall #system call
	.end_macro
	
.data #these are all strings being defined that will be refered to often during the rest of the code
	prompt: .asciz  "Enter the height of the pattern (must be greater than 0):" 
	errorMsg: .asciz  "Invalid Entry!"
	money: .asciz "$"
	asterisk: .asciz "*"
	newline: .asciz  "\n"
	
.text #the text section will finish off the rest of the code

main: #main is where the nest loops and the rest of the code (including the printing) will take place
	li t0,1 #assigning the number 1 to the register t0
	print_str(prompt) #asking the input message
	li a7,5 
	ecall #system call
	addi t1,a0,0 #adding a0 to equal t1
	blt t1,t0,errorPrint #if t1 is less than 1, then jump to the errorPrint and follow steps
	b validEntry
	
	
errorPrint:
	print_str(errorMsg) #print the invalid message
	print_str(newline) #indent to new line 
	print_str(prompt) #finally print the input prompt message again on the new line
	li a7, 5
	ecall #system call
	addi t1, a0, 0 #equal the new a0 to t1 
	blt t1, t0,errorPrint #if in the case that t1 is till less than t0, restart the errorPrint process until it fits the needs to continue
	b validEntry #jump to the brach validEntry


validEntry:
	li t2, 0 #setting 0 to a variable that will be used in loop and loop_update to make sure the alternating nested loops do not go past the length of the integer input
	li t3, 1 #assigning 1 to t3 
	li t4, 0 #assign the number zero to t4 
	
#start of outer loop
loop:
	bge t2, t1, loop_exit #checking if t2 is greater than or equal to t1, and if so to jump to loop_exit

#start of inner loop
nestedInnerOne:
	print_str(money) #print out the money character
	addi t4, t4, 1	#t4 equals t4 plus one
	bge t4, t3, endingLoop #checks if t4 is greater than or equal to t3 and if so, then jump to endingLoop, if not, then continue


nestedInnerTwo:
	print_str(asterisk) #print out the asterisk character
	addi t4, t4, 1 #t4 equals t4 plus one
	bge t4, t3, endingLoop #checks if t4 is greater than or equal to t3 and if so, then jump to endingLoop, if not, then continue
	b nestedInnerOne #jumo branch to nestedInnerOne
#end of inner loop
	
#ending outer loop
endingLoop:
	print_int(t3) #print out t3 at the end of the characters on the line
	print_str(newline) #print a new line to type on
#end of outer loop
		
	
loop_update:
	addi t3,t3,2 #t3 equals t3 plus 2 everytime loop update is called inorder to get the odd numbers for the given input
	addi t2,t2,1 #t2 equals t2 plus 1 every time loop update is called like a counter
	li t4, 0 #assign the number zero to t4 
	b loop #branch back to the start of the loop section
	
	
loop_exit:
	exit #exit out of the code 
