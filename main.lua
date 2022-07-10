pad = {}
pad.x = 0
pad.y = 0
pad.largeur = 20
pad.hauteur = 80

pad2 ={}
pad2.x = love.graphics.getWidth() - pad.largeur
pad2.y = 0
pad2.largeur = 20
pad2.hauteur = 80

balle = {}
balle.x = 400
balle.y = 300
balle.largeur = 20
balle.hauteur = 20
balle.vitesse_x = - 2
balle.vitesse_y = - 2

function CentreBalle()
  balle.x = love.graphics.getWidth() / 2
  balle.x = balle.x - balle.largeur /2
  
  balle.y = love.graphics.getHeight() / 2
  balle.y = balle.y - balle.hauteur / 2
  
  balle.vitesse_x = 2
  balle.vitesse_y = 2
  end

function love.load()

CentreBalle()

end

function love.update()
  balle.x = balle.x + balle.vitesse_x
  balle.y = balle.y + balle.vitesse_y
        if love.keyboard.isDown("q") and pad.y <  love.graphics.getHeight() - pad.hauteur then
    pad.y = pad.y + 2
        end
          if love.keyboard.isDown("a") and pad.y > 0 then
          pad.y = pad.y - 2
          end
            if love.keyboard.isDown("down") and pad2.y < love.graphics.getHeight() - pad.hauteur then
    pad2.y = pad2.y + 2
            end
              if love.keyboard.isDown("up") and pad2.y > 0 then
              pad2.y = pad2.y - 2
              end
       
                if balle.x < 0 then 
                balle.vitesse_x = - balle.vitesse_x
                end
                  if balle.y < 0 then
                  balle.vitesse_y = - balle.vitesse_y
                  end
                    if balle.x > love.graphics.getWidth() - balle.largeur then
                    balle.vitesse_x = - balle.vitesse_x
                    end
                      if balle.y > love.graphics.getHeight() - balle.largeur then 
                      balle.vitesse_y = - balle.vitesse_y
                      end
                        if balle.x <= pad.x + pad.largeur then
                          if balle.y + balle.hauteur > pad.y and balle.y < pad.y +pad.hauteur then
                          balle.vitesse_x = - balle.vitesse_x
                          balle.x = pad.x + pad.largeur
                          end
                        end
                          if balle.x + balle.largeur >= pad2.x then
                            if balle.y > pad2.y and balle.y < pad2.y + pad.hauteur then
                            balle.vitesse_x = - balle.vitesse_x
                            balle.x = pad2.x - pad2.largeur
                            end
                          end
                            if balle.x <= 0 then
                            CentreBalle()
                          end
                          if balle.x + balle.largeur >= 799 then
                            CentreBalle()
                            end
        
  end

function love.draw()
    love.graphics.rectangle("line", pad.x, pad.y, pad.largeur, pad.hauteur)
    love.graphics.rectangle("fill", balle.x, balle.y, balle.largeur, balle.hauteur)
    love.graphics.rectangle("line", pad2.x, pad2.y, pad2.largeur, pad2.hauteur)
  end