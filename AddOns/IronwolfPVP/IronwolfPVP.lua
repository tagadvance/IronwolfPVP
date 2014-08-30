local elapsed_time = 0
local delay_seconds = 1
local function onUpdate(self, elapsed)
  elapsed_time = elapsed_time + elapsed
  if elapsed_time < delay_seconds then
    return
  end

  local is_desired = GetPVPDesired()
  if is_desired == 0 then
    SetPVP(1)
  end
  
  elapsed_time = 0
end

local frame = CreateFrame("frame")
frame:SetScript("OnUpdate", onUpdate)
