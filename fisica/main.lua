-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here


local physics = require('physics')
physics.start()

local fondo = display.newImage('demo/bkg_clouds.png')
fondo.x = display.contentCenterX
fondo.y = display.contentCenterY

local piso = display.newImage('demo/ground.png', display.contentCenterX, 445)


local caja1 = display.newImage('demo/crate.png', 100, 50)

physics.addBody( caja1, 'dynamic', {friction= 0.3, bounce=0.3, density= 1.0,})

physics.addBody( piso, 'static',  {friction= 0.3, bounce=0.3, density= 1.0,})


local caja2 = display.newImage('demo/crate.png', 130, 130)

physics.addBody( caja2,'dynamic', {friction= 0.0, bounce=0.3, density= 1.0,})















