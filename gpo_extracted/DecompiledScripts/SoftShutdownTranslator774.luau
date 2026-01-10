return require(script.Parent.loader).load(script)("JSONTranslator").new("en", {
    shutdown = {
        lobby = {
            title = "Rebooting servers for update.", 
            subtitle = "Teleporting back in a moment..."
        }, 
        restart = {
            title = "Rebooting servers for update.", 
            subtitle = "Please wait..."
        }, 
        complete = {
            title = "Rebooting servers for update.", 
            subtitle = "Update complete..."
        }
    }
});