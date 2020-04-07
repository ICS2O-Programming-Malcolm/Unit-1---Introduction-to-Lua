----------------------------------------------------------------------------------------
-- Title: WhackAMoleMalcolm
-- Name: Malcolm Cantin
-- Course: ICS2O
-- This program places a random object on the screen. If the user clicks on it in time,
-- the score increases by 1.
----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

----------------------------------------------------------------------------------------
-- OBJECT CREATION
----------------------------------------------------------------------------------------

-- Create the background 
    local bkg = display.newRect(0, 0, display.contentWidth, display.contentHeight)
    bkg:setFillColor(51/255, 0/255, 102/255)

    -- Set the position of the background
    bkg.anchorX = 0
    bkg.anchorY = 0
    bkg.x = 0
    bkg.y = 0

-- Creating Waldo
local waldo = display.newImage("Images/waldo.png", 0, 0)

    -- Set the position of the Waldo
    waldo.x = display.contentCenterX
    waldo.y = display.contentCenterY

    waldo:scale(2/5, 2/5)

    waldo.isVisible = false

-- Variable to keep track of score
local score = 0

-- Local text object to display score
local scoreText = display.newText("Score = " .. score .. "", 874, 718, nil, 60)
scoreText:setFillColor(153/255, 0/255, 0/255)

----------------------------------------------------------------------------------------
-- SOUNDS
----------------------------------------------------------------------------------------
local dingSound = audio.loadSound("Sounds/ding.mp3")
local dingSoundChannel

local bkgMusic = audio.loadSound("Sounds/bkgMusic.mp3")
local bkgMusicChannel = audio.play(bkgMusic)


----------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------

-- This function makes Waldo appear in a random (x,y) position on the screen
-- before calling the the Hide funtion
function PopUp()

    -- Choosing random position on the screen between 0 and the size of the screen
    waldo.x = math.random(0, display.contentWidth)
    waldo.y = math.random(0, display.contentHeight)

    waldo.isVisible = true

    timer.performWithDelay(800, Hide)

end

-- This function calls the PopUp function after 3 seconds
function PopUpDelay()

    timer.performWithDelay(3000, PopUp)

end

-- This function makes the Waldo invisible and then calls the PopUpDelay function
function Hide()

    -- Change the visibility
    waldo.isVisible = false

    PopUpDelay()

end

-- This function starts the game
function GameStart()

    PopUpDelay()

end

-- This function increments the score only if the Waldo is clicked. It then displays the
-- new score.
function Whacked(event)

    -- If touch phase just started
    if (event.phase == "began") then

        score = score + 1
        scoreText.text = "Score = " .. score .. ""

        dingSoundChannel = audio.play(dingSound)

    end

end

----------------------------------------------------------------------------------------
-- EVENT LISTENERS
----------------------------------------------------------------------------------------
-- I added the event listener to Waldo so that if Waldo is touched, the Whacked
-- function is called
waldo:addEventListener( "touch", Whacked)

----------------------------------------------------------------------------------------
-- START THE GAME
----------------------------------------------------------------------------------------
GameStart()