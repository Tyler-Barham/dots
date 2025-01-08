local M = {}

local gears = require("gears")
local awful = require("awful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

local sharedtags = require("awesome-sharedtags")
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')

local modkey = "Mod4"

local groups = {
    awesome = "awesome",
    apps = "awesome apps",
    screens = "screen",
    media = "media",
}

M.get_globalkeys = function()
    local globalkeys = gears.table.join(
        -- Awesome manipulation
        awful.key({ modkey,           }, "s",      function (c, _) hotkeys_popup.show_help(c, 1) end,
            {description="Show help", group=groups.awesome}),
        awful.key({ modkey, "Control" }, "r", awesome.restart,
            {description = "Reload awesome", group = groups.awesome}),
        awful.key({ modkey,           }, "x",
            function ()
                awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                }
            end,
            {description = "Lua execute prompt", group = groups.awesome}),
        awful.key({ modkey,           }, "Escape", function () awful.spawn.with_shell("dm-tool lock") end,
            {description = "Lock screen", group = groups.awesome}),
        awful.key({ modkey, "Shift"   }, "Escape", function () awful.spawn.with_shell("sudo shutdown now") end,
            {description = "Shutdown", group = groups.awesome}),

        -- Standard programs
        awful.key({ modkey,           }, "t", function () awful.spawn(terminal) end,
            {description = "Open terminal", group = groups.apps}),
        awful.key({ modkey,           }, "b", function () awful.spawn(browser) end,
            {description = "Open browser", group = groups.apps}),
        awful.key({ modkey,           }, "f", function () awful.spawn(filemanager) end,
            {description = "Open file manager", group = groups.apps}),
        awful.key({                   }, "Print", function () awful.spawn.with_shell("flameshot gui") end,
            {description = "Flameshot", group = groups.apps}),
        -- Prompts
        awful.key({ modkey },            "r",     function () awful.spawn.with_shell("rofi -show drun -theme ~/.config/rofi/launchers/custom.rasi") end,
            {description = "Run prompt", group = groups.apps}),
        awful.key({ modkey }, "p", function() menubar.show() end,
            {description = "Show the menubar", group = groups.apps}),

        -- Screen manipulation
        awful.key({ modkey,          }, "l", function () awful.screen.focus_relative( 1) end,
            {description = "focus the next screen", group = groups.screens}),
        awful.key({ modkey,          }, "h", function () awful.screen.focus_relative(-1) end,
            {description = "focus the previous screen", group = groups.screens}),


        awful.key({ modkey,           }, "j",
            function ()
               awful.client.focus.byidx( 1)
            end,
            {description = "focus next by index", group = "client"}
        ),
        awful.key({ modkey,           }, "k",
            function ()
                awful.client.focus.byidx(-1)
            end,
            {description = "focus previous by index", group = "client"}
        ),

        -- Layout manipulation
        awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
            {description = "swap with next client by index", group = "client"}),
        awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
            {description = "swap with previous client by index", group = "client"}),
        awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
            {description = "jump to urgent client", group = "client"}),
        awful.key({ modkey,           }, "Tab",
            function ()
                awful.client.focus.history.previous()
                if client.focus then
                    client.focus:raise()
                end
            end,
            {description = "go back", group = "client"}),

        awful.key({ modkey, "w"       }, "l",     function () awful.tag.incmwfact( 0.05)          end,
            {description = "increase master width factor", group = "layout"}),
        awful.key({ modkey, "w"       }, "h",     function () awful.tag.incmwfact(-0.05)          end,
            {description = "decrease master width factor", group = "layout"}),
        awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
            {description = "increase the number of master clients", group = "layout"}),
        awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
            {description = "decrease the number of master clients", group = "layout"}),
        awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
            {description = "increase the number of columns", group = "layout"}),
        awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
            {description = "decrease the number of columns", group = "layout"}),
        awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
            {description = "select next", group = "layout"}),
        awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
            {description = "select previous", group = "layout"}),


        awful.key({}, "XF86AudioRaiseVolume", function() volume_widget.inc() end,
            {description = "Increase volume", group = groups.media}),
        awful.key({}, "XF86AudioLowerVolume", function() volume_widget.dec() end,
            {description = "Decrease volume", group = groups.media}),
        awful.key({}, "XF86AudioMute", function() volume_widget.toggle() end,
            {description = "Mute volume", group = groups.media}),

        awful.key({}, "XF86AudioPlay", function() awful.spawn.with_shell("sp play") end,
            {description = "Spotify play/pause", group = groups.media}),
        awful.key({}, "XF86AudioPrev", function() awful.spawn.with_shell("sp prev") end,
            {description = "Spotify previous track", group = groups.media}),
        awful.key({}, "XF86AudioNext", function() awful.spawn.with_shell("sp next") end,
            {description = "Spotift next track", group = groups.media})
    )

    return globalkeys
end

M.get_clientkeys = function()
    local clientkeys = gears.table.join(
        awful.key({ modkey,           }, "q",      function (c) c:kill()                         end,
            {description = "close", group = "client"}),
        awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
            {description = "toggle floating", group = "client"}),
        awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
            {description = "move to master", group = "client"}),
        awful.key({ modkey,           }, "m",      function (c) c:move_to_screen()               end,
            {description = "move client to screen", group = groups.screens})
    )
    return clientkeys
end

M.get_tagkeys = function(tags)
    local tagkeys = {}
    for i = 1, #tags do
        tagkeys = gears.table.join(
            tagkeys,
            -- View tag only.
            awful.key({ modkey }, i,
                function ()
                    local tag = tags[i]
                    if tag then
                        sharedtags.jumpto(tag)
                    end
                end,
                {description = "view tag #"..i, group = "tag"}),
            -- View tag on current screen
            awful.key({ modkey, "Control" }, i,
                function ()
                    local screen = awful.screen.focused()
                    local tag = tags[i]
                    if tag then
                        sharedtags.viewonly(tag, screen)
                    end
                end,
                {description = "view tag on focused screen #" .. i, group = "tag"}),
            -- Move client to tag.
            awful.key({ modkey, "Shift" }, i,
                function ()
                    if client.focus then
                        local tag = tags[i]
                        if tag then
                            client.focus:move_to_tag(tag)
                            sharedtags.jumpto(tag)
                        end
                    end
                end,
                {description = "move focused client to tag #"..i, group = "tag"})
        )
    end
    return tagkeys
end

M.modkey = modkey

return M
