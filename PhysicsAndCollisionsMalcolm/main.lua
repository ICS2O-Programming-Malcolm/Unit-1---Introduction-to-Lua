----------------------------------------------------------------------------------------------------
-- Title: PhysicsAndCollisionsMalcolm
-- Name: Malcolm Cantin
-- Course: ICS2O
-- This program has objects that fall and collide with the ground. I added extra objects and 
-- modified the location and angle of the ramp. I also added background music.
----------------------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()

----------------------------------------------------------------------------------------------------
-- BACKGROUND MUSIC
----------------------------------------------------------------------------------------------------
local bkgMusic = audio.loadSound("Sounds/bkg_music.mp3")

audio.play(bkgMusic)

----------------------------------------------------------------------------------------------------
-- OBJECTS
----------------------------------------------------------------------------------------------------

-- ground
local ground = display.newImage("Images/ground.png", 0, 0)

-- ground parameters
ground.x = display.contentWidth / 2
ground.y = display.contentHeight

-- change the width to be the same as the screen
ground.width = display.contentWidth

-- add to physics
physics.addBody(ground, "static", {friction = 0.5, bounce = 0.3})

----------------------------------------------------------------------------------------------------

-- beam
local beam = display.newImage("Images/beam.png", 0, 0)

-- beam parameters
beam.x = display.contentCenterX / 7.1
beam.y = display.contentCenterY * 1.65

beam.width = display.contentWidth / 2
beam.height = display.contentHeight * (1/10)

-- rotate the beam -60 degrees so it is on an angle
beam:rotate(60)

-- send it to the back layer
beam:toBack()

-- add to physics 
physics.addBody(beam, "static", {friction = 0.5, bounce = 0.3})

----------------------------------------------------------------------------------------------------

-- create background
local bkg = display.newImage("Images/bkg.png", 0, 0)

-- background parameters
bkg.x = display.contentCenterX
bkg.y = display.contentCenterY

bkg.width = display.contentWidth
bkg.height = display.contentHeight

-- send to back
bkg:toBack()

----------------------------------------------------------------------------------------------------

-- wall
local wall = display.newImage("Images/ground.png", 0, 0)

-- wall parameters
wall.x = display.contentWidth 
wall.y = display.contentHeight * (2/3)

-- rotate the wall 90 degrees so it is upright
wall:rotate(90)

-- add to physics
physics.addBody(wall, "static", {friction = 0.5, bounce = 0.3})

----------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------

-- create the first ball
local function firstBall()
    -- creating the first ball
    local ball1 = display.newImage("Images/super_ball.png", 0, 0)

    -- add physics
    physics.addBody(ball1, {density = 1.0, friction = 0.5, bounce = 0.3, radius = 25})
end

----------------------------------------------------------------------------------------------------

-- create the second ball
local function secondBall()
    -- creating the second ball
    local ball2 = display.newImage("Images/super_ball.png", 0, 0)

    -- add physics
    physics.addBody(ball2, {density = 1.0, friction = 0.5, bounce = 1, radius = 12.5})

    ball2:scale(0.5, 0.5)
end

----------------------------------------------------------------------------------------------------

-- create the third ball
local function thirdBall()
    -- creating the third ball
    local ball3 = display.newImage("Images/super_ball.png", 0, 0)

    -- add physics
    physics.addBody(ball3, {density = 1.0, friction = 1, bounce = 0.3, radius = 50})

    ball3:scale(2, 2)
end

----------------------------------------------------------------------------------------------------

-- create the fourth ball
local function fourthBall()
    -- creating the fourth ball
    local ball4 = display.newImage("Images/super_ball.png", 0, 0)

    -- add physics
    physics.addBody(ball4, {density = 5.0, friction = 0.5, bounce = 0.3, radius = 100})

    ball4:scale(4, 4)
end

----------------------------------------------------------------------------------------------------
-- TIMER DELAYS - call each function after the given millisecond
----------------------------------------------------------------------------------------------------
timer.performWithDelay(0, firstBall)
timer.performWithDelay(500, secondBall)
timer.performWithDelay(1000, thirdBall)
timer.performWithDelay(2000, fourthBall)
