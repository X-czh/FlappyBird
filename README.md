# FlappyBird

Digital Logic Final Project Report

By: Mengmeng Li and Zhanghao Chen

CENG-SHU 201 Digital Logic

13 December, 2016

## I. Introduction

Our goal is to design a game resembling Flappybird. The player controls the “bird” on a VGA screen to move upward or downward, trying to pass the tubes through the space between them. Once the player passes one tube, the score is incremented by 1, displayed on the 7-seg display. The final score will be displayed on the VGA screen when the game ends.

## II. Implementation

### FlappyBird:

Top Module: main architecture.

### VGA_Controller:

This module generates the horizontal and vertical sync signals at the appropriate times based on the VGA timing (and also the module Draw_Tubes). It also generates converted x, y coordinates (remove the back porches of the horizontal and vertical displays) for the sake of simpler display control at VGA_Bitgen. 

### VGA_Bitgen:

This is the combinational circuit that takes the converted x, y coordinates, and bright signals from VGA_Controller, and the positions of the bird and tubes from Draw_Bird and Draw_Tubes , and decides for each pixel what color should be on the screen. When the game ends, it displays the score won on the VGA screen by simulating 7-seg displays on screen.

### SevenSegScoreDisplay:

This module was a descendent of the similar Lab Assignment, which displays a decimal number (the score won) ranging from 0 to 255 on three 7-seg displays.

### SignalFrequency:

This module was a descendent of the similar Lab Assignment, which converts 100MHz signal to 10Hz’s signal. This module provides the modified clock signal for Draw_Bird.

### Draw_Bird:

This module controls the movement of the bird. When the up button was pressed once in a 10-Hz clock cycle, the bird moves upward for 6 pixels, and vice versa. 

### Draw_Tubes:

This module controls the position and movement of the tubes. The horizontal position of the tubes was moved 5 pixel at a rising edge of the 10Hz clock, while the vertical coordinates of the 3 tubes remain unchanged until tube1’s x coordinate approaches 0. At this moment, tube2 becomes tube1, and tube3 becomes tube2, and a new y coordinate was generated for tube3 through module random_gen. The x coordinate for the new tube was assigned to be 630. 

### Random_gen:

This module generates a pseudo-random 7-bit number, by initial assignment of a 21-bit number (with its digits all equal 1’s) and multiplication of its 18th and 21th digits. We consulted pseudo random generator examples for reference.

### Collision_Detect:

This module detects the collision by evaluating whether the bird’s x and y position falls out of the space of the gap between the higher tube and the lower tube. If a collision is thus detected, the output game_end is assigned to be 1.

## III. Trouble-Shooting

### 1.	Synchronicity among Clocks

We originally used 2 different clocks (10Hz and 60Hz) for input clock signals in module Draw_Tubes and VGA_Controller, which results in the scale effect: the position of the tubes changes in the middle of a frame. We fixed this bug by forcing the 60Hz signal to be the input clock signal for Draw_Tubes and VGA_Controller.

### 2.	Smooth Transition of Tubes

Originally the tube disappeared abruptly when its left edge touched the left side of the screen, and concurrently, a whole tube appear abruptly from the right side of the screen. It is because we fixed the x variable of the VGA display to be in [0, 639], and the x position coordinate of the tube was set to be the middle of the tube; therefore, x has to be a negative number when we want smooth transition while it can’t be. We fixed this by adjust the x variable to allow its values varies from 144 to 783 to be displayed on the screen; therefore when wiping out passed tubes, we can set tube’s x coordinate to be a positive number smaller than 144. 

### 3.	Score Display

Shifting values of the x variable creates a new bug in score display: when the game ends, the left segments overlaps with the middle ones by 5 pixels due to miscalculations. We fixed this by calculating the initial position once again.

### 4.	Bird’s Flight Limits

Originally when the bird “fly” out of the screen, it directly disappears while the score still rises up, creating a chance for cheating. We fixed this by setting if-else commands to let the bird stay in the boundary position when its y coordinate moves out of the frame.
