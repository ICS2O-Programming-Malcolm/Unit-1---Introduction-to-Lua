-- Title: TouchAndReactMalcolm
-- Name: Malcolm Cantin
-- Course: ICS2O
-- This program

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
display.setDefault("background", 160/255, 160/255, 160/255)

-- create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true 

-- create red button, set its position and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create text object, set its position and make it invisible
local textObject = display.newText("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1, 0, 0)
textObject.isVisible = false

-- create image which will appear when the blue button is clicked
local checkmark = display.newImageRect("Images/checkmark.png", 198, 96)
checkmark.x = display.contentWidth*(3/4)
checkmark.y = display.contentHeight/2
checkmark.isVisible = false

-- create image which will appear when the blue button has not be clicked
-- or is unclicked
local redX = display.newImageRect("Images/red_x.png", 198, 96)
redX.x = display.contentWidth*(1/4)
redX.y = display.contentHeight/2
redX.isVisible = true

-- add sounds that will play depending on whether the blue button is clicked or the red button
-- is released
local correctSound = audio.loadSound( "Sounds/Correct Answer Sound Effect.mp3" )
local wrongBuzzer = audio.loadSound( "Sounds/Wrong Buzzer Sound Effect.mp3" )

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear with the red button,
-- and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		checkmark.isVisible = true
		redX.isVisible = false
		audio.play( correctSound, {duration = 500} )
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		checkmark.isVisible = false
		redX.isVisible = true
		audio.play( wrongBuzzer, {duration = 500} )
	end
end

-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)

-- Function: RedButtonListener
-- Input: touch listener
-- Output: none
-- Description: when red button is let go, it will make the text disappear,
-- and make the blue button appear
local function RedButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		checkmark.isVisible = false
		redX.isVisible = true
		audio.play( wrongBuzzer, {duration = 500} )
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		checkmark.isVisible = false
		redX.isVisible = true
		audio.play( wrongBuzzer, {duration = 500} )
	end
end

-- add the respective listeners to each object
redButton:addEventListener("touch", RedButtonListener)

