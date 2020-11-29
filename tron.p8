pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- init

function _init()
 
 bgcolour = 2
 
 -- create the game board
 
 board = {}
 
 for c=0,127 do
  board[c] = {}
  for r=0,127 do
   board[c][r] = bgcolour
  end
 end
 
 -- create the players
 p1 = { n=1, x=20, y=20, c=7, dx=0, dy=1 }
 p2 = { n=2, x=107, y=107, c=9, dx=0, dy=-1 }
 players = {p1, p2}
 
end
-->8
-- update

function _update()

 if #players == 1 then
  return
 end

 for p in all(players) do
 
  -- check lose collision or
  -- outside of game board
  if p.x < 0 or p.x > 127
     or p.y < 0 or p.y > 127 
     or board[p.x][p.y] != bgcolour then
   del(players,p)
   break
  end
 
  -- player controls
  -- left
  if btn(0,p.n-1) then
   p.dx = -1
   p.dy = 0
  end
  -- right
  if btn(1,p.n-1) then
   p.dx = 1
   p.dy = 0
  end
  -- up
  if btn(2,p.n-1) then
   p.dx = 0
   p.dy = -1
  end
  -- down
  if btn(3,p.n-1) then
   p.dx = 0
   p.dy = 1
  end
 
  -- add current player pos
  board[p.x][p.y] = p.c
  
  -- update player position
  p.x = p.x + p.dx
  p.y = p.y + p.dy 
  
 end

end
-->8
-- draw

function _draw()
 
 cls()
 
 -- draw the game board
 
 for c=0,127 do
  for r=0,127 do
   pset(c,r,board[c][r])
  end
 end
 
 -- show winner
 if #players == 1 then
  rectfill(0,55,128,69,0)
  print('p' .. players[1].n .. ' wins!',50,60,players[1].c)
 end
 
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
