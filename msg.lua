maxMsg=10
maxTime=90

mx=0
my=0

msg={}

--time limit for msg
function tickMsg()
	for i = #msg, 1, -1 do
    msg[i].t=msg[i].t+1
    if msg[i].t>maxTime then
      table.remove(msg,i)
    end
	end
end

function msgToCvs()
	my=0
	-- for i,t in ipairs(msg)
	-- do
		-- love.graphics.setColor(0.,0.,0.,1.)
		-- love.graphics.print(t,mx,my)
		-- my=my+20
	-- end
	love.graphics.setColor(1.,1.,1.,1.)

	for i = #msg, 1, -1 do
		love.graphics.print(msg[i].text,mx,my)
		my=my+20
	end
--	love.graphics.setColor(1.,1.,1.,1.)
end

function addMsg(tx)
	table.insert(msg,{text=tx,t=0})
	if maxMsg<=tbllngth(msg) then
		table.remove(msg,1)	
	end

end
