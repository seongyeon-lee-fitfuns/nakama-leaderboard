local nk = require("nakama")

local function create_leaderboard_rpc(context, payload)
    local data = nk.json_decode(payload or "{}")
    local id = nk.uuid_v4()
    local authoritative = data.authoritative or false
    local sort = data.sort or "desc"
    local operator = data.operator or "best"
    local reset = data.reset or "0 0 * * 0"
    local metadata = data.metadata or {}    
    nk.leaderboard_create(id, authoritative, sort, operator, reset, metadata)
    return nk.json_encode({ success = true, leaderboard_id = id })
end

nk.register_rpc(create_leaderboard_rpc, "create_leaderboard")
