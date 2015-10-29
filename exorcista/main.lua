-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here



local physics = require('physics')
physics.start()
physics.setScale( 50 )
local game  = display.newGroup()

local circulo = display.newImage('gfx/exorcist.png')
circulo.x = 250
game:insert( circulo)

physics.addBody( circulo, 'dynamic', {friction=0.3, bounce=0.3, density=1.0} )


local piso = display.newRect(0, 650, 2048, 3 )
physics.addBody( piso, 'static',{friction=0.3, bounce=0.3, density=1.0} )
game:insert(piso )

for i=0,3 do

	for j=0,1 do
		local x = 600 + (120 * j)
		local y = 50 + i * 160
		local cajas = display.newImage('gfx/block1.png')
		cajas.x = x
		cajas.y = y + 80
		physics.addBody( cajas, 'dynamic', {friction=0.3, bounce=0.3, density=1.0} )
		game:insert( cajas)

		if j< 1  then
			local cajas2 = display.newImage('gfx/block1.png')
			game:insert( cajas2)
			cajas2.rotation = 90
			cajas2.x = x + 60
			cajas2.y = y
			physics.addBody( cajas2, 'dynamic', {friction=0.3, bounce=0.3, density=1.0} )
		end
	end
	
end

function touchCirculo(event)
	if event.phase == 'began' then
		display.getCurrentStage( ):setFocus( circulo )
	elseif event.phase == 'ended' then
		circulo:applyLinearImpulse( event.xStart - event.x, event.yStart - event.y, circulo.x, circulo.y )
	end
end

circulo:addEventListener( 'touch', touchCirculo )

function loop ()
	game.x =  250-circulo.x
end


Runtime:addEventListener( 'enterFrame', loop )



-- addiel.juarez@negoapps.com
-- @addieljuarez
-- githug.com/addieljuarez
-- gist.github.com/addieljuarez


























