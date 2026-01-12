return require(script.Parent.loader).load(script)("Table").readonly({
    REMOTE_EVENT_STORAGE_NAME = "RemoteEvents", 
    REMOTE_FUNCTION_STORAGE_NAME = "RemoteFunctions"
});