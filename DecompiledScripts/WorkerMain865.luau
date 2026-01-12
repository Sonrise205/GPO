return function(v0, ...) --[[ Line: 1 ]]
    task.desynchronize();
    v0(...);
    task.synchronize();
end;