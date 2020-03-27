-----------------------------------------------------------------------------------------
-- Title: MovingImages
-- Name: Malcolm Cantin
-- Course: ICS2O
-- This program moves a beetleship across the screen and then makes it fade in. I added
-- a second object that moves in a different direction, fades out and shirnks in size.
-----------------------------------------------------------------------------------------
-- Your code here

------------------------------------------------------------------------------------------------
-- SOUNDS
------------------------------------------------------------------------------------------------

-- Boing sound
local boingSound = audio.loadSound( "Sounds/BoingSoundEffect.mp3")
local boingSoundChannel

-- Pop sound
local popSound = audio.loadSound( "Sounds/PopSound.wav")
local popSoundChannel

-- Background music
local backgroundSound = audio.loadSound( "Sounds/bkgMusic.mp3")
local backgroundSoundChannel

-- Play the background music when the program begins
backgroundSoundChannel = audio.play(backgroundSound)

------------------------------------------------------------------------------------------------
-- MOVEMENT
------------------------------------------------------------------------------------------------

-- CODE FOR THE BEETLESHIP
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)

	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed

	-- change the transparency of the ship every time it moves so that it fades out
	beetleship.alpha = beetleship.alpha + 0.01

end

-- play boing sound
boingSoundChannel = audio.play(boingSound)

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

-- CODE FOR THE ROCKETSHIP
-- character image with width and height
local rocketship = display.newImageRect("Images/rocketship.png", 200, 200)

-- set the image to be transparent
rocketship.alpha = 1

-- set the initial x and y position of rocketship
rocketship.x = 1024
rocketship.y = display.contentHeight*(2/3)

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveRocket(event)
	-- add the scroll speed to the x-value of the ship
	rocketship.x = rocketship.x - scrollSpeed - 2
	-- change the transparency of the ship every time it moves so that it fades out
	rocketship.alpha = rocketship.alpha - 0.000000001
end

-- play pop sound with a bit of a delay
popSoundChannel = audio.play(popSound)

-- MoveRocket will be called over and over again
Runtime:addEventListener("enterFrame", MoveRocket)

-- flip the rocket
rocketship:scale(-1, 1)