local M = {}

local awful = require("awful")
local beautiful = require("beautiful")

local sharedtags = require("awesome-sharedtags")
local keymaps = require("Tyler-Barham.keymaps")

local tags = sharedtags({
    { name = "main", screen = 1, layout = awful.layout.suit.tile },
    { name = "chat", screen = 1, layout = awful.layout.suit.tile },
    { name = "work", screen = 1, layout = awful.layout.suit.tile },
    { name = "misc", screen = 1, layout = awful.layout.suit.tile },
    { name = "misc", screen = 1, layout = awful.layout.suit.tile },
    { name = "www",  screen = 2, layout = awful.layout.suit.tile.bottom },
    { name = "song", screen = 2, layout = awful.layout.suit.tile.bottom },
    { name = "misc", screen = 2, layout = awful.layout.suit.tile.bottom },
    { name = "misc", screen = 2, layout = awful.layout.suit.tile.bottom },
    { name = "misc", screen = 2, layout = awful.layout.suit.tile.bottom },
})

local set_rules = function()
end

M.get_tags = function()
    return tags
end

M.setup = function()
    local client_keymaps = keymaps.get_clientkeys()

    -- Rules to apply to new clients (through the "manage" signal).
    awful.rules.rules = {
        -- All clients will match this rule.
        { rule = { },
            properties = { border_width = beautiful.border_width,
                           border_color = beautiful.border_normal,
                           focus = awful.client.focus.filter,
                           raise = true,
                           keys = client_keymaps,
                           buttons = clientbuttons,
                           screen = awful.screen.preferred,
                           placement = awful.placement.no_overlap+awful.placement.no_offscreen
            }
        },

        -- Floating clients.
        { rule_any = {
            instance = {
                "DTA",  -- Firefox addon DownThemAll.
                "copyq",  -- Includes session name in class.
                "pinentry",
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "MessageWin",  -- kalarm.
                "Sxiv",
                "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
                "Wpa_gui",
                "veromix",
                "xtightvncviewer",
            },

            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester",  -- xev.
            },
            role = {
                "AlarmWindow",  -- Thunderbird's calendar.
                "ConfigManager",  -- Thunderbird's about:config.
                "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
            }
          }, properties = { floating = true }},

        -- No titlebars
        { rule_any = {type = { "normal", "dialog" } },
            properties = { titlebars_enabled = false }
        },

        -- Set rules to map apps to tags.
        { rule = { class = "org.wezfurlong.wezterm" },
            properties = { tag = tags["main"] } },
        { rule = { class = "teams-for-linux" },
            properties = { tag = tags["chat"] } },
        { rule = { class = "Brave-browser" },
            properties = { tag = tags["www"] } },
        { rule = { class = "Spotify" },
            properties = { tag = tags["song"] } },


        { rule = { class = "Engine" },
            properties = { tag = tags["work"], floating = true } },
    }
end

return M

