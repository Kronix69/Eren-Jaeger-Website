--rbxsig%jf7mRT/qm1JSQz2PuEOtZvQufquXzX7Md+bZ00xHbqtjymCidkjx0bWTqn3DJNEImgMZ9EvWkBny3YQ/rfpxOfA9DOZeArur/EV+slgd1aDeD8OpXerAvM8J3/u+WYg4b1S83+LEoJPoHiSg+IgJZcOq5m4x6eEs1SFclAIntYU=%
local Players = game:GetService("Players")
local NetworkClient = game:GetService("NetworkClient")
local ScriptContext = game:GetService("ScriptContext")

-- 1320 for mid 2014 corescripts and 2006 for late 2014
ScriptContext:AddStarterScript(2006)

NetworkClient:PlayerConnect(353, "147.185.221.229", 60526)

local LocalPlayer = Players.LocalPlayer
LocalPlayer.Name = "Aesthetiful"
LocalPlayer.CharacterAppearance = "http://tadah.rocks/users/353/character?tick=" .. tick()

local PlayerToken = Instance.new("StringValue", LocalPlayer)
PlayerToken.Name = "token"
PlayerToken.Value = "LazmlernNzYP206nqHh3"

pcall(function() LocalPlayer:SetMembershipType(0) end)
pcall(function() LocalPlayer:SetSuperSafeChat(false) end)
pcall(function() Players:SetChatStyle(2) end)

pcall(function() game:SetCreatorId(1555, Enum.CreatorType.User) end)
pcall(function() game:SetPlaceId(732) end)

game:SetMessage("Connecting to server")

NetworkClient.ConnectionAccepted:connect(function(Peer, NetworkReplicator)
    NetworkReplicator.Disconnection:connect(function(Peer, LostConnection)
        if LostConnection then
            game:SetMessage("You have lost connection to the game")
        else
            game:SetMessage("This game has shut down")
        end
    end)

    game:SetMessageBrickCount()

    local MarkerReceived = false

    local NetworkMarker = NetworkReplicator:SendMarker()
    NetworkMarker.Received:connect(function()
        MarkerReceived = true

        game:SetMessage("Requesting character")
        NetworkReplicator:RequestCharacter()

        game:SetMessage("Waiting for character")
        LocalPlayer.CharacterAdded:connect(function()
            game:ClearMessage()
        end)
    end)

    while not MarkerReceived do
        workspace:ZoomToExtents()
        wait(0.5)
    end
end)

NetworkClient.ConnectionFailed:connect(function(Peer, ErrorCode, ErrorMessage)
    game:SetMessage(string.format("Failed to connect to the Game. (ID=%d)", ErrorCode))
end)
