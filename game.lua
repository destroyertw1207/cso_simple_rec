
-- #ui_simple_rec
-- Made by. DestroyerI滅世I ( Destroyertw1207 )

-- 武器重生裝置：夜視鏡 - 座標 {x, y, z}
pickup_nvg = Game.EntityBlock.Create({x = 6, y = 0, z = 0})
function pickup_nvg:OnUse(player)
	player:Signal(1)
end

-- 武器移除裝置 - 座標 {x, y, z}
remove_nvg = Game.EntityBlock.Create({x = 6, y = 2, z = 0})
function remove_nvg:OnTouch(player)
	player:Signal(2)
end

-- 道具產出方塊：電池 - 座標 {x, y, z}
pickup_battery = Game.EntityBlock.Create({x = 6, y = -2, z = 0})
function pickup_battery:OnUse(player)
	player:Signal(3)
end
