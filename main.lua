#!/usr/local/bin/love
-- Tutorial https://sheepolution.com/learn/book/7
-- Tick https://github.com/rxi/tick
function love.load()
	tick = require "tick"
	bg = {
		img = love.graphics.newImage("img/bg/002.jpeg")
	}
	r = {
		img = love.graphics.newImage("img/tokens/001.png"),
		x = 70,
		y = 70,
		dx = 0,
		dy = 0,
		r = 0,
		sx = 0.546,
		sy = 0.546
	}
end

local function troquel_token()
	love.graphics.circle("fill",         r.x+35, r.y+35, 35)
end

function love.draw()
	--love.graphics.rectangle("line", r.x, r.y, 50, 50)
	love.graphics.draw(bg.img, 0, 0);

	love.graphics.stencil(troquel_token, "replace", 1);
	love.graphics.setStencilTest("greater", 0)
	love.graphics.draw(r.img, r.x, r.y, r.r, r.sx, r.sy);
	love.graphics.setStencilTest()
end

function love.update(dt)
	tick.update(dt)
	if love.keyboard.isDown("right") then r.dx = 1 	end
	if love.keyboard.isDown("left")  then r.dx = -1	end
	if love.keyboard.isDown("up")    then r.dy = -1	end
	if love.keyboard.isDown("down")  then r.dy = 1	end
	r.x = r.x + r.dx * 20 * dt
	r.y = r.y + r.dy * 20 * dt
end

