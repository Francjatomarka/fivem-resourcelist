local resources = {}
local activeResourceList = {}
local deactivatedResourceList = {}
local allResourcesList = {}

local function ResourcesUpdated()
    activeResourceList = {}
    deactivatedResourceList = {}
    allResourcesList = {}
    for resourceName, state in next, resources do
        if state == true then
            table.insert(activeResourceList, resourceName)
        elseif state == false then
            table.insert(deactivatedResourceList, resourceName)
        end
        table.insert(allResourcesList, resourceName)
    end
    TriggerEvent("onResourceListUpdate", activeResourceList)
end

local function SetResourceState(resourceName, state)
    resources[resourceName] = state
    ResourcesUpdated()
end

local function AddResource(resourceName)
    SetResourceState(resourceName, true)
end
AddEventHandler("onResourceStart", AddResource)

local function RemoveResource(resourceName)
    SetResourceState(resourceName, false)
end
AddEventHandler("onResourceStop", RemoveResource)

function GetActiveResourceList()
    return activeResourceList
end

function GetDeactivatedResourceList()
    return deactivatedResourceList
end

function GetAllResources()
    return allResourcesList
end
