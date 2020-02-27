-----------------------------------------------------------------------------------------
-- Title: AreaOfRectangleAndCircle
-- Name: Malcolm Cantin
-- Course: ICS20
-- This program displays a rectangle, and a circle, and will show each shape's area.
-----------------------------------------------------------------------------------------

-- Your code here

-- Code For The Rectangle

-- create my local variables
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle

-- set the background colour of my screen. Remember that colors are between 0 and 1.
display.setDefault("background", 255/255, 128/255, 0/255)

-- remove the status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

-- set the width of the border
myRectangle.strokeWidth = 15

-- set the colour of the rectangle 
myRectangle:setFillColor(0.8, 0.1, 0.9)

-- set the color of the border
myRectangle:setStrokeColor(0, 1, 1)

-- calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaText = display.newText("The area of this rectangle with a width of \n" ..
	widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
	areaOfRectangle .. " pixels².", 0, 0, Arial, textSize)

--anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/2

-- set the colour of the newText
areaText:setTextColor(1, 1, 1)

-- Code For The Circle

-- create my local variables
local circleAreaText
local textSize = 30
local myCircle
local radiusOfCircle = 100
local PI = 3.14
local areaOfCircle

-- draw the circle that is beside the rectangle
myCircle = display.newCircle(0, 0, radiusOfCircle)

-- anchor the circle beside the rectangle and set its (x,y) position
myCircle.anchorX = 0
myCircle.anchorY = 0
myCircle.x = 400
myCircle.y = 10

-- set the width of the circle's border
myCircle.strokeWidth = 20

-- set the colour of the circle 
myCircle:setFillColor(0.1, 0.8, 0.4)

-- set the color of the border
myCircle:setStrokeColor(1, 0, 0)

-- calculate the area
areaOfCircle = PI * radiusOfCircle * radiusOfCircle

-- write the area on the screen. Take into consideration the size of the font when positioning it on the screen.
circleAreaText = display.newText("The area of this circle with a radius of \n" ..
	radiusOfCircle .. " is " ..
	areaOfCircle .. " pixels².", 0, 0, Arial, textSize)

--anchor the text and set its (x,y) position
circleAreaText.anchorX = 0
circleAreaText.anchorY = 0
circleAreaText.x = 500
circleAreaText.y = display.contentHeight/2.75

-- set the colour of the newText
circleAreaText:setTextColor(1, 1, 1)