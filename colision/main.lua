-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here


-- 1) Set up the physics engine
local physics = require("physics")
physics.start()
physics.setDrawMode( "hybrid" )  -- "hybrid" for testing; "default" for gameplay

-- 2) Create the platform
local platform = display.newRect( display.contentCenterX, 250, 100, 25 )
platform:setFillColor( 1,0,0 )
physics.addBody( platform, "kinematic" )
platform.travelDistance = 200  -- Set the total travel distance
platform.speed = 40  -- Set the speed for the platform
platform.id = 1  -- Set platform ID for collision detection with sensors (see below)

-- 3) Create the sensor objects
local leftSensor = display.newRect( 0, platform.y, 10, platform.height )
leftSensor.isVisible = false
physics.addBody( leftSensor, "dynamic", { isSensor=true } )
leftSensor.gravityScale = 0  -- Make the sensor float (no effect from gravity)
leftSensor.id = 1  -- Set sensor ID for collision detection with respective platform
leftSensor.x = platform.x - ( platform.travelDistance * 0.5 )

local rightSensor = display.newRect( 0, platform.y, 10, platform.height )
rightSensor.isVisible = false
physics.addBody( rightSensor, "dynamic", { isSensor=true } )
rightSensor.gravityScale = 0  -- Make the sensor float (no effect from gravity)
rightSensor.id = 1  -- Set sensor ID for collision detection with respective platform
rightSensor.x = platform.x + ( platform.travelDistance * 0.5 )

-- 4) Set up the collision handler function/listener
local function onCollision( self, event )
    if ( "began" == event.phase and self.id == event.other.id ) then
        local vx,vy = self:getLinearVelocity()
        self:setLinearVelocity( -vx, -vy )
    end
end
platform.collision = onCollision
platform:addEventListener( "collision", platform )

-- 5) Set the platform in motion
platform:setLinearVelocity( platform.speed, 0 )