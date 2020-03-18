------------------------------------------------------------------------------------------------
-- Title: NumericTextFieldsMalcolm
-- Name: Malcolm Cantin
-- Course: ICS2O
-- This program... ... ... ... ... ... ... ... ...
------------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar) 

-- sets the background colour
display.setDefault("background", 124/255, 249/255, 199/255)

------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
------------------------------------------------------------------------------------------------

-- create local variables
local questionObject
local correctObject

local numericField

local randomNumber1
local randomNumber2

local userAnswer
local correctAnswer
local correctAnswerText
local incorrectAnswer

local points = 0
local wrongs = 0

------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
------------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 15)
	randomNumber2 = math.random(0, 15)

	-- set correctAnswer to the added 2 random numbers
	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object\
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- user begins editing "numericField"
	if ( event.phase == "began" ) then

		-- clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the user's answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
		
			-- give a point if the user gets the correct answer and display "Correct!"
			points = points + 1
			correctObject.isVisible = true

			-- update it in the display object
			pointsText.text = "Points = " .. points

			-- perform HideCorrect with a delay and clear the text field
			timer.performWithDelay(1500, HideCorrect)
			event.target.text = ""

		else
			-- add one to the wrongs total
			wrongs = wrongs + 1

			-- display "Incorrect!" and show the right answer
			incorrectObject.isVisible = true
			correctAnswerText = display.newText( "The correct answer is " .. correctAnswer, display.contentWidth/2, display.contentHeight*(4/5), nil, 50, {duration=2000} )
			timer.performWithDelay(4000, HideIncorrect)
			event.target.text = ""
		end	
				
		if (points == 5) then
			local win = display.newImageRect("Images/win.png", 300, 300)
			win.x = display.contentWidth/4
			win.y = display.contentHeight/4
		end
		
		if (wrongs == 3) then
			local lose = display.newImageRect("Images/lose.png", 512, 384)
			lose.x = display.contentWidth/4
			lose.y = display.contentHeight/4
		end
	end
end

------------------------------------------------------------------------------------------------
-- OBJECT CREATION
------------------------------------------------------------------------------------------------

-- display the amount of points as a text object
pointsText = display.newText("Points = " .. points, display.contentWidth*(3/4), display.contentHeight*(1/4), nil, 50)
pointsText:setTextColor(0/255, 0/255, 0/255)

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/2 - 50, display.contentHeight/2, nil, 100 )
questionObject:setTextColor(155/255, 42/255, 198/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(0/255, 0/255, 204/255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
incorrectObject:setTextColor(204/255, 0/255, 102/255)
incorrectObject.isVisible = false

-- create numeric field
numericField = native.newTextField( display.contentWidth*(3/4), display.contentHeight/2, 150, 100 )
numericField.inputType = "number"

-- add the event listeners for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
------------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()