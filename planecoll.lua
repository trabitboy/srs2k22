function planeWColl(x1,w1,x2,w2)
  --debug 
--  print('planeWColl '..x1..' '..w1..' '..x2..' '..w2)
  local tcol=false
  if x2 <= (x1+w1) and x2>=x1 then 
    --x2 bet x1 and x1 w1 
    tcol=true
--    print(' hcol ')
  
  end
  if (x2+w2) <= (x1+w1) and (x2+w2)>=x1 then 
    --x2 bet x1 and x1 w1 
    tcol=true
--    print(' hcol ')
  end
  return tcol
end

--WIP -- until robots jump, then we change to cube coll
function planeSqColl(x1,y1,w1,h1,x2,y2,w2,h2)
--  hcol=false
--  if x2 < (x1+w1) and x2>x1 then 
--    --x2 bet x1 and x1 w1 
--    hcol=true
--  end
--  if (x2+w2) < (x1+w1) and (x2+w2)>x1 then 
--    --x2 bet x1 and x1 w1 
--    hcol=true
--  end
  hcol=planeWColl(x1,w1,x2,w2)
  
  vcol=planeWColl(y1,h1,y2,h2)
  
  if vcol and hcol then
    return true
  end
  
  return false
end
--WIP NOT DONE
function cubeSqColl(x1,y1,z1,w1,h1,d1,x2,y2,z2,w2,h2,d2)
--  hcol=false
--  if x2 < (x1+w1) and x2>x1 then 
--    --x2 bet x1 and x1 w1 
--    hcol=true
--  end
--  if (x2+w2) < (x1+w1) and (x2+w2)>x1 then 
--    --x2 bet x1 and x1 w1 
--    hcol=true
--  end
  hcol=planeSqColl(x1,w1,x2,w2)
  
  vcol=planeWColl(y1,h1,y2,h2)
  
  zcol=planeWColl(z1,h1,y2,h2)
  
  
  
  if vcol and hcol then
    return true
  end
  
  return false
end

