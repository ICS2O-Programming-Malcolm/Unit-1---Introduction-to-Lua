-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- print a greeeting to the console
print ("**** Hello Malcolm!")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 175/255, 2/255, 120/255)

-- create a local variable
local textObject

-- displays text on the screen at position x = 500 and y = 250 with a default font style and font size of 100
textObject = display.newText( "Hello, Malcolm!", 500, 250, nil, 100)

-- sets the color of the text
textObject:setTextColor(189/255, 254/255, 254/255)

-- create another local variable
local textObjectSignature

-- displays text on the screen at position x = 500 and y = 500 with a default font style and font size of 45 
textObjectSignature = display.newText( "Created by: Malcolm Cantin", 500, 500, nil, 45)

-- sets the color of the text signature
textObjectSignature:setTextColor(66/255, 200/255, 245/255)