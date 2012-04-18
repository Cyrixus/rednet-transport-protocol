--[[
    titan
    
    An RTP webhost. Titan is basically analogous to real-world Apache.
    
    Matthew DiBeranrdo [04.13.2012]
]]--

-- Main Titan Class
Titan = {}

function Titan:start()

end


-- Titan Listen Server
function rtpListen()
    while true do
        msg = rtp.listen(10) -- Wait for a message
        if msg ~= nil then
            mArr = json.Decode(msg)
            os.pushEvent("RTP-"..mArr["Type"], mArr)
        end
    end
end


-- Titan Event Handler
EventHandler = {_e = {}}

function EventHandler:registerEvent(event, method)
    self._e[event] = method
end

function EventHandler:unregisterEvent(event)
    self._e[event] = nil
end

function EventHandler:handle(event, msg)
    if self._e[event] != nil then
        return self._e[event](msg)
    end
end

function EventHandler:listen()
    while true do
        event, msg = os.pullEventRaw()
        status = EventHandler:handle(event, msg)
    end
end