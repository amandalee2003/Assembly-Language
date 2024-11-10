#in this section of code, you must direct the new position of the pixel based on the label we branched to in lab4.asm

#remember at this point, (x,y) coordinates are in a0,a1 registers respectively
#do the appropriate change in a0 a1 values based on the labels below.

#within each label, make sure to jump to the correct label in  lab4.asm file. 
#This is so that exactly one of the labels moveleft,moveright, movedown, moveup is executed depending on which key user enetered as defined in lab4.asm

#NOTE: To make sure you ONLY use a0,a1 registers in your instructions below. There is no need to involve any other rgeister in this section of code!

#Pseudo code:
#Regular keys
#For moveLeft
#Add immediate for x equaling x -1 
#Meaning the x coordinate is subtracted by one and moves one to the left
#Then jump to newPosition so it doesn't repeat
#For moveDown
#Since y going down is actually plus one, add immediate for y equaling y 1
#Then jump to newPosition so it doesn't repeat
#For moveRight
#Add immediate for x equaling x 1
#Meaning the x coordinate is added by one and moves one to the right
#Then jump to newPosition so it doesn't repeat
#For moveUp
#Since moving up causes y to lose 1, add immediate for y equaling y -1
#Then jump to newPosition so it doesn't repeat
#Diagonal Keys
#For moveDiagonalLeftUp
#Add immediate for x equaling x -1 
#Move coordinates for x down one
#Since moving up causes y to lose 1, add immediate for y equaling y -1
#Move coordinates for y up one
#Then jump to newPosition so it doesn't repeat
#For moveDiagonalLeftDown
#Add immediate for x equaling x -1 
#Move coordinates for x down one
#Since y going down is actually plus one, add immediate for y equaling y 1
#Move coordinates for y down one
#Then jump to newPosition so it doesn't repeat	
#For moveDiagonalRightUp
#Add immediate for x equaling x 1
#Move coordinates for x up one
#Since moving up causes y to lose 1, add immediate for y equaling y -1
#Move coordinates for y up one
#Then jump to newPosition so it doesn't repeat
#For moveDiagonalRightDown
#Add immediate for x equaling x 1
#Move coordinates for x up one
#Since y going down is actually plus one, add immediate for y equaling y 1
#Move coordinates for y down one
#Then jump to newPosition so it doesn't repeat



#Start with the coordinates of x and y being (0,0)
moveleft:
	#enter code here
	addi a0,a0,-1 
	j newPosition #Jump to newPosition 
	
	#none of wasd were hit? :( How about the diagonal keys?
	
movedown:
	#enter code here
	addi a1,a1,1 #Move coordinates for y down one
	j newPosition #Jump to newPosition 
	
moveright:
	#enter code here
	addi a0,a0,1 #Move coordinates for x up one
	j newPosition #Jump to newPosition 
		
moveup:
	#enter code here
	addi a1,a1,-1 #Move coordinates for y up one
	j newPosition #Jump to newPosition 
	
moveDiagonalLeftUp:
	#enter code here
	addi a0,a0,-1 #Move coordinates for x down one
	addi a1,a1,-1 #Move coordinates for y up one
 	j newPosition #Jump to newPosition 
 	
moveDiagonalLeftDown:
	#enter code here
	addi a0,a0,-1 #Move coordinates for x down one
	addi a1,a1,1 #Move coordinates for y down one
 	j newPosition #Jump to newPosition 
 	
moveDiagonalRightUp:
	#enter code here
	addi a0,a0,1 #Move coordinates for x up one
	addi a1,a1,-1 #Move coordinates for y up one
 	j newPosition #Jump to newPosition 
 	
moveDiagonalRightDown:
	#enter code here
	addi a0,a0,1 #Move coordinates for x up one
	addi a1,a1,1 #Move coordinates for y down one
 	j newPosition #Jump to newPosition 