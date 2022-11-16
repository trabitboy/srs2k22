
require("linesquarecoll")

x1=10
y1=10

x2=20
y2=20

x1=10
y1=30

x2=20
y2=20


yl=30

ret=lineToHoriLine(x1,y1,x2,y2,yl)


function love.draw()
--  love.graphics.clear(1,1,1,1)
  love.graphics.print('line sq test '..ret.x.. ' ' .. ret.y)
  
  love.graphics.line(x1,y1,x2,y2)
  
  love.graphics.line(0,yl,400,yl)
  
end
