local elapsed_time = 0
local delay_seconds = 60
local function onUpdate(self, elapsed)
  elapsed_time = elapsed_time + elapsed
  if elapsed_time >= delay_seconds then
    -- DEFAULT_CHAT_FRAME:AddMessage("refreshing pvp flag...")
    SetPVP(1);
    elapsed_time = 0
  end
end

local frame = CreateFrame("frame")
frame:SetScript("OnUpdate", onUpdate)
