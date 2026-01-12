--!native
local v0 = require(script.Index);
return {
    Server = v0.Server, 
    Client = v0.Client, 
    fromServerArray = v0.fromServerArray, 
    fromClientArray = v0.fromClientArray, 
    OnSpamSignal = v0.OnSpamSignal, 
    Signal = v0.Signal, 
    fromSignalArray = v0.fromSignalArray, 
    buffer = v0.buffer
};