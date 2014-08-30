local elapsed_time = 0
local delay_seconds = 60
local function onUpdate(self, elapsed)
  elapsed_time = elapsed_time + elapsed
  if elapsed_time >= delay_seconds then
    local isPVPDesired = GetPVPDesired()
    if isPVPDesired == 0 then
      DEFAULT_CHAT_FRAME:AddMessage("Why aren't you flagged for PVP!?")
    end
    elapsed_time = 0
  end
end

local frame = CreateFrame("frame")
frame:SetScript("OnUpdate", onUpdate)