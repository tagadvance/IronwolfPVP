local PVP_FLAG = 300000
local EXPIRES_DELAY = 15
local REMINDER_DELAY = 60

local elapsed_time = 0
local delay_seconds = 1
local elapsed_seconds = 0
local function onUpdate(self, elapsed)
  elapsed_time = elapsed_time + elapsed
  if elapsed_time < delay_seconds then
    return
  end
  elapsed_time = 0
  elapsed_seconds = elapsed_seconds + 1

  local timer = GetPVPTimer()
  if timer <= PVP_FLAG then
    local seconds = math.floor(timer / 1000)
    local is_expiring = seconds % EXPIRES_DELAY == 0
    if is_expiring then
      DEFAULT_CHAT_FRAME:AddMessage(seconds .. " seconds until your PVP flag expires!")
    end
    return
  end

  local isPVPDesired = GetPVPDesired()
  local is_remind = elapsed_seconds % REMINDER_DELAY == 0
  if isPVPDesired == 0 and is_remind then
    DEFAULT_CHAT_FRAME:AddMessage("Why aren't you flagged for PVP!?")
  end
end

local frame = CreateFrame("frame")
frame:SetScript("OnUpdate", onUpdate)
