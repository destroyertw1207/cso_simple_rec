
-- #ui_simple_rec
-- Made by. DestroyerI滅世I ( Destroyertw1207 )

--[[
	
	-- 【CSO API : UI.Box / Text】
	
	BOX = UI.Box.Create()       |	TEXT = UI.Text.Create()
	BOX:Set({                   |	TEXT:Set({
		  x      = 0 -- x座標   |		  text   = "" -- 文字
		, y      = 0 -- y座標   |		, font   = "" -- 大小 ( small (小), medium (中), large (大), verylarge (非常大) )
		, width  = 0 -- 寬度    |		, align  = "" -- 排列 ( left (左), center (中), right (右) )
		, height = 0 -- 高度    |		, x      = 0 -- x座標
		, r      = 0 -- 紅色    |		, y      = 0 -- y座標
		, g      = 0 -- 綠色    |		, width  = 0 -- 寬度
		, b      = 0 -- 藍色    |		, height = 0 -- 高度
		, a      = 0 -- 透明度  |		, r      = 0 -- 紅色
	})                          |		, g      = 0 -- 綠色
										, b      = 0 -- 藍色
										, a      = 0 -- 透明度
									})
									
	.Hide()      -- 隱藏
	.Show()      -- 顯示
	:Get()       -- :Set的內容 ( table )
	:IsVisible() -- true 為 顯示狀態 ( Show ) / false 為 隱藏狀態 ( Hide )
]]

--[[
	
	-- 【math - 部分】
	
	-- 1. a + b 後不大於 c
		
		a = math.min(a + b, c)
		
	-- 2. a - b 後不小於 c
	
		a = math.max(a - b, c)
		
	-- 3. a 為 b 無條件捨去
	
		a = math.floor(b)
		
	-- 4. a 為 b 無條件進位
	
		a = math.ceil(b)
	
	-- 5. 取 a 為 c 的整數部分 與 b 為 c 的小數部分
	
		a, b = math.modf(c)
]]

--[[

	-- 【string - 部分】
	
	-- 1. 字串格式
	
		a = 1
		b = 0.125
		c = "hello world!"
		
		-- %d 整數
		
		string.format("%d", a)
		-- output: 1
		
		string.format("%02d", a)
		-- output: 01
		
		string.format("%05d", a)
		-- output: 00001
		
		-- %f 小數
		
		string.format("%f", a)
		-- output: 1.0
		
		string.format("%f", b)
		-- output: 0.125
		
		string.format("%.2f", b)
		-- output: 0.12
		
		-- %s 字串
		
		string.format("%s", c)
		-- output: hello world!

]]

--[[
	
	-- 【迴圈 - for】
	
	-- 1. 讓 var變數 從 a值 跑到 b值 每次增加 c ( *c非必填，預設: 1 )
	
		for var = a, b, c do
			
		end
		
		-- 「範例」
		
		for i = 1, 10 do -- i 從 1 跑到 10 每次增加 1
			print(i)
			
				-- output i:
				-- 1 2 3 4 5 6 7 8 9 10
		end
		
		for j = 1, 10, 2 do -- j 從 1 跑到 10 每次增加 2
			print(j)
			
				-- output j:
				-- 1 3 5 7 9
		end
		
		for k = 10, 1, -1 do -- k 從 10 跑到 1   | 	for l = 1, 10, -1 do -- l 從 10 跑到 1
			print(k)                             | 		print(l)
												 |			
				-- output k:                     | 			-- output l:
				-- 10 9 8 7 6 5 4 3 2 1          | 			-- 10 9 8 7 6 5 4 3 2 1
		end                                      | 	end
		
	-- 2. 跑一遍 table陣列 的內容
		
		table = {}
		for var1, var2 in pairs(table) do
			
		end
		
		-- 「範例」
		
		table1 = {    |	table1 = {
			  1       |		  [1] = 1
			, 10      |		, [2] = 10
			, 100     |		, [3] = 100
			, true    |		, [4] = true
			, false   |		, [5] = false
			, ":<"    |		, [6] = ":<"
			, {}      |		, [7] = {}
		}             |	}
		
		for i, j in pairs(table1) do
			print(i)
			
				-- output: i
				-- 1, 2, 3, 4, 5, 6, 7
				
			print(j)
			
				-- output: j
				-- 1, 10, 100, true, false, :<, table
		end
		
		table2 = {
			  [  1]  = 0
			, [  2]  = true
			, [100]  = "hello world!"
			
			, a      = 1
			, b      = 2
			
			, ["c"]  = ":<"
			, ["幹"] = "Made by. DestroyerI滅世I ( Destroyertw1207 )"
		}
		
		for k, v in pairs(table2) do
			print(k)
			
				-- output: k
				-- 1, 100, 2, b, c, a, 幹 ( *陣列內變數若不為數字則會是隨機順序 )
				
			print(v)
			
				-- output: v
				-- 0, "hello world", true, 2, :<, 1, Made by. DestroyerI滅世I ( Destroyertw1207 )
		end
	
]]

local screen = UI.ScreenSize()

function UI_Load_rec()
	rec = {
		-- ( *不可調整 )
		  box = {}
		, txt = {}
		, log = "\n\n--------------------------------------------\n\n#cso_simple_rec\n@Made by DestroyerI滅世I ( Destroyertw1207 )\n\n--------------------------------------------\n"
		
		, pickup      = false -- 拾取夜視鏡狀態
		, bds         = 0     -- 電池消耗速度
		, fs          = 0     -- 紅燈閃爍速度
		
		-- ( *可調整 )
		, power       = 100   -- 剩餘電量
		, drain_speed = 0.1   -- 電池消耗速度
		, drain_value = 1     -- 電池消耗量
		, flash_speed = 1     -- 紅燈閃爍速度
		
		, batterypower = 50   -- 電池增加電量
	}
	
	if not rec.log then
		return
	end
	
	-- 微調夜視鏡顏色
	rec.box[ 1] = UI.Box.Create()
	rec.box[ 1]:Set({x = 0, y = -50, width = screen.width, height = screen.height + 100, r = 50, g = 0, b = 0, a = 150})
	
	-- 電量耗盡
	rec.box.nopower = UI.Box.Create()
	rec.box.nopower:Set({x = 0, y = -50, width = screen.width, height = screen.height + 100, r = 0, g = 0, b = 0, a = 225})
	
	-- 四個角：「」
	rec.box[ 2] = UI.Box.Create()
	rec.box[ 2]:Set({x = 50, y = 125, width = 100, height = 10, r = 200, g = 200, b = 200})
	rec.box[ 3] = UI.Box.Create()
	rec.box[ 3]:Set({x = 50, y = 125, width = 10, height = 100, r = 200, g = 200, b = 200})
	rec.box[ 4] = UI.Box.Create()
	rec.box[ 4]:Set({x = screen.width - 50, y = 125, width = - 100, height = 10, r = 200, g = 200, b = 200})
	rec.box[ 5] = UI.Box.Create()
	rec.box[ 5]:Set({x = screen.width - 50, y = 125, width = - 10, height = 100, r = 200, g = 200, b = 200})
	rec.box[ 6] = UI.Box.Create()
	rec.box[ 6]:Set({x = 50, y = screen.height - 125, width = 100, height = 10, r = 200, g = 200, b = 200})
	rec.box[ 7] = UI.Box.Create()
	rec.box[ 7]:Set({x = 50, y = screen.height - 115, width = 10, height = - 100, r = 200, g = 200, b = 200})
	rec.box[ 8] = UI.Box.Create()
	rec.box[ 8]:Set({x = screen.width - 50, y = screen.height - 125, width = - 100, height = 10, r = 200, g = 200, b = 200})
	rec.box[ 9] = UI.Box.Create()
	rec.box[ 9]:Set({x = screen.width - 50, y = screen.height - 115, width = - 10, height = - 100, r = 200, g = 200, b = 200})
	
	-- 電池
	rec.box[10] = UI.Box.Create()
	rec.box[10]:Set({x = screen.width - 240, y = 175, width = 90, height = 1, r = 200, g = 200, b = 200})
	rec.box[11] = UI.Box.Create()
	rec.box[11]:Set({x = screen.width - 240, y = 210, width = 90, height = 1, r = 200, g = 200, b = 200})
	rec.box[12] = UI.Box.Create()
	rec.box[12]:Set({x = screen.width - 150, y = 175, width = 1, height = 35, r = 200, g = 200, b = 200})
	rec.box[13] = UI.Box.Create()
	rec.box[13]:Set({x = screen.width - 240, y = 175, width = 1, height = 10, r = 200, g = 200, b = 200})
	rec.box[14] = UI.Box.Create()
	rec.box[14]:Set({x = screen.width - 240, y = 200, width = 1, height = 10, r = 200, g = 200, b = 200})
	rec.box[15] = UI.Box.Create()
	rec.box[15]:Set({x = screen.width - 245, y = 185, width = 5, height = 1, r = 200, g = 200, b = 200})
	rec.box[16] = UI.Box.Create()
	rec.box[16]:Set({x = screen.width - 245, y = 200, width = 5, height = 1, r = 200, g = 200, b = 200})
	rec.box[17] = UI.Box.Create()
	rec.box[17]:Set({x = screen.width - 245, y = 185, width = 1, height = 15, r = 200, g = 200, b = 200})
	
	-- 電量
	rec.box.power = UI.Box.Create()
	rec.box.power:Set({x = screen.width - 155, y = 178, width = - 80, height = 30, r = 200, g = 200, b = 200})
	
	rec.txt[1] = UI.Text.Create()
	rec.txt[1]:Set({text = 'ＲＥＣ', font = 'medium', align = 'left', x = 200, y = 165, width = 1000, height = 100, r = 200, g = 200, b = 200})
	rec.txt.redlight = UI.Text.Create()
	rec.txt.redlight:Set({text = '●', font = 'medium', align = 'left', x = 150, y = 165, width = 100, height = 100, r = 200, g = 0, b = 0})
	rec.txt.time = UI.Text.Create()
	rec.txt.time:Set({text = '00:00:00:00', font = 'medium', align = 'center', x = screen.width / 2 - 500, y = screen.height - 160, width = 1000, height = 100, r = 200, g = 200, b = 200})
	
	for k, v in pairs(rec.box) do
		v:Hide()
	end
	for k, v in pairs(rec.txt) do
		v:Hide()
	end
end
UI_Load_rec()

-- 按下按鍵
function UI.Event:OnKeyDown(inputs)
	if inputs[UI.KEY.N] then
		if pickup then
			if rec.box[1]:IsVisible() then
				for k, v in pairs(rec.box) do
					v:Hide()
				end
				for k, v in pairs(rec.txt) do
					v:Hide()
				end
			else
				for k, v in pairs(rec.box) do
					v:Show()
				end
				for k, v in pairs(rec.txt) do
					v:Show()
				end
			end
		end
	end
end

-- 接收 game.lua - player:Signal 訊號
function UI.Event:OnSignal(signal)
	if signal == 1 then
		if not pickup then
			pickup = true
			rec.power = 100
		end
	end
	if signal == 2 then
		pickup = false
		for k, v in pairs(rec.box) do
			v:Hide()
		end
		for k, v in pairs(rec.txt) do
			v:Hide()
		end
	end
	if signal == 3 then
		rec.power = math.min(rec.power + rec.batterypower, 100)
	end
end

-- 每偵執行 ( 會受到玩家 fps 影響速度 )
function UI.Event:OnUpdate(time)
	-- 顯示時間 - HH:MM:SS:MS
	local _, ms = math.modf(time) ms = math.floor(ms * 100)
	local s = math.floor(time) % 60
	local m = math.floor(time / 60) % 60
	local h = math.floor(time / 60 / 60) % 24
	rec.txt.time:Set({text = string.format("%02.0f:%02.0f:%02.0f:%02.0f", h, m, s, ms)})
	
	if rec.box[1]:IsVisible() then
		
		if rec.fs < time then
			rec.fs = time + rec.flash_speed
			if rec.txt.redlight:IsVisible() then
				rec.txt.redlight:Hide()
			else
				rec.txt.redlight:Show()
			end
		end
		
		if rec.bds < time then
			rec.bds = time + rec.drain_speed
			rec.power = math.max(rec.power - rec.drain_value, 0)
			rec.box.power:Set({width = - rec.power * 0.8})
		end
		rec.box.power:Set({height = 30})
		
		if rec.power == 0 then
			rec.box.nopower:Show()
			rec.txt.redlight:Set({r = 250, g = 125, b = 0})
		else
			rec.box.nopower:Hide()
			rec.txt.redlight:Set({r = 200, g = 0, b = 0})
		end
		
	end
end
