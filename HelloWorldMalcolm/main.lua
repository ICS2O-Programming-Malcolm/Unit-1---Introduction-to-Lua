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
display.setDefault("background", 124/255, 249/255, 199/255)

-- create a local variable
local textObject

-- displays text on the screen at position x = 500 and y = 500 with a default font style and font size of 50
textObject = display.newText( "Hello, Malcolm!", 500, 500, nil, 50 )

-- sets the color of the text
textObject:setTextColor(155/255, 42/255, 198/255)