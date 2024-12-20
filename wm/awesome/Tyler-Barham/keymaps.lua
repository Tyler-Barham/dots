local M = {}

local gears = require("gears")
local awful = require("awful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

local modkey = "Mod4"

local groups = {
    awesome = "awesome",
    apps = "awesome apps",
    screens = "screen",
}

M.globalkeys = gears.table.join(
    -- Awesome manipulation
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
        {description="Show help", group=groups.awesome}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
        {description = "Reload awesome", group = groups.awesome}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
        {description = "Quit awesome", group = groups.awesome}),
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
    awful.key({ modkey,           }, "Escape", function () awful.spawn. with_shell("xautolock -locknow") end,
        {description = "Lock screen", group = groups.awesome}),

    -- Standard programs
    awful.key({ modkey,           }, "t", function () awful.spawn(terminal) end,
        {description = "Open terminal", group = groups.apps}),
    awful.key({ modkey,           }, "b", function () awful.spawn(browser) end,
        {description = "Open browser", group = groups.apps}),
    awful.key({ modkey,           }, "f", function () awful.spawn(filemanager) end,
        {description = "Open file manager", group = groups.apps}),
    -- Prompts
    awful.key({ modkey },            "r",     function () awful.spawn.with_shell("rofi -show drun") end,
        {description = "Run prompt", group = groups.apps}),
    awful.key({ modkey }, "p", function() menubar.show() end,
        {description = "Show the menubar", group = groups.apps}),

    -- Screen manipulation
    awful.key({ modkey,          }, "l", function () awful.screen.focus_relative( 1) end,
        {description = "focus the next screen", group = groups.screens}),
    awful.key({ modkey,          }, "h", function () awful.screen.focus_relative(-1) end,
        {description = "focus the previous screen", group = groups.screens}),


    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
        {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
        {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, ";", awful.tag.history.restore,
        {description = "go back", group = "tag"}),

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
        {description = "select previous", group = "layout"})
)

M.clientkeys = gears.table.join(
    awful.key({ modkey,           }, "q",      function (c) c:kill()                         end,
        {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
        {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
        {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "m",      function (c) c:move_to_screen()               end,
        {description = "move client to screen", group = groups.screens})
)

local max_tags = 5
for i = 1, max_tags do
    M.globalkeys = gears.table.join(M.globalkeys,
        -- View tag only.
        awful.key({ modkey }, i,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, i,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, i,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                        tag:view_only()
                    end
                end
            end,
            {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, i,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

M.modkey = modkey

return M
