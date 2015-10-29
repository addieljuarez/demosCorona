-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here


local centroX = display.contentCenterX
local centroY = display.contentCenterY
local width = display.contentWidth
local height = display.contentHeight


local topRef = 0
local bottomRef = 1
local leftRef = 0
local rightRef = 1
local centerRef = 0.5


display.setStatusBar( display.HiddenStatusBar )


local cielo = display.newImage('images/cielo.png', centroX, centroY)

local lineaBase = 280


local arbol = {}

arbol[0] = display.newImage('images/arbol1.png' )
arbol[0].xScale = 0.2
arbol[0].yScale = 0.2
arbol[0].anchorY = bottomRef
arbol[0].x = 20
arbol[0].y = lineaBase
arbol[0].dx = 0.1




arbol[1] = display.newImage('images/arbol2.png' )
arbol[1].xScale = 0.2
arbol[1].yScale = 0.2
arbol[1].anchorY = bottomRef
arbol[1].x = 250
arbol[1].y = lineaBase
arbol[1].dx = 0.1



arbol[2] = display.newImage('images/arbol3.png' )
arbol[2].xScale = 0.2
arbol[2].yScale = 0.2
arbol[2].anchorY = bottomRef
arbol[2].x = 450
arbol[2].y = lineaBase
arbol[2].dx = 0.1


local corredor = graphics.newImageSheet( "images/sprite2.png", {width=160, height=220, numFrames=10 } )


local instancia = display.newSprite( corredor, { name="running", start=1, count=10, time=1000} )
instancia.x = 100
instancia.y = lineaBase - 70
instancia.xScale = 0.7
instancia.yScale = 0.7
instancia:play()


local pasto = display.newImage('images/pasto.png')
pasto.anchorX = leftRef
pasto.x = 0
pasto.y = lineaBase

local pasto2 = display.newImage('images/pasto.png')
pasto2.anchorX = leftRef
pasto2.x  = 480
pasto2.y = lineaBase


local previous = system.getTimer()

local function move(event)
	local tDelta = event.time - previous
	previous = event.time

	local xOffset = (0.2 * tDelta)

	pasto.x = pasto.x - xOffset

	pasto2.x = pasto2.x - xOffset
	if(pasto.x + pasto.contentWidth) < 0 then
		pasto:translate( 480*2, 0 )
	end
	if(pasto2.x + pasto.contentWidth) < 0 then
		pasto2:translate(480 * 2, 0)
	end

	local i
	for i = 0, #arbol, 1 do
		arbol[i].x = arbol[i].x - arbol[i].dx * tDelta * 0.2
		if(arbol[i].x + arbol[i].contentWidth) < 0 then
			arbol[i]:translate( 480 + arbol[i].contentWidth + 50 , 0 )
		end
	end


end


Runtime:addEventListener( 'enterFrame', move )











