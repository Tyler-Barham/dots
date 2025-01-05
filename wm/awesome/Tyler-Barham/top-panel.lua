
local M = {}

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local keymaps = require("Tyler-Barham.keymaps")

M.create = function(s)
    local panel = awful.wibar({
        screen = s,
        position = "top",
        height = 25,
        width = s.geometry.width,
        opacity = 1
    })

    -- Create a wibox for each screen and add it
    local taglist_buttons = gears.table.join(
        awful.button({ }, 1, function(t) t:view_only() end),
        awful.button({ keymaps.modkey }, 1, function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end),
        awful.button({ }, 3, awful.tag.viewtoggle),
        awful.button({ keymaps.modkey }, 3, function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end),
        awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
        awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
    )

    local tasklist_buttons = gears.table.join(
        awful.button({ }, 1, function (c)
            if c == client.focus then
                c.minimized = true
            else
                c:emit_signal(
                    "request::activate",
                    "tasklist",
                    {raise = true}
                )
            end
        end),
        awful.button({ }, 3, function()
            awful.menu.client_list({ theme = { width = 250 } })
        end),
        awful.button({ }, 4, function ()
            awful.client.focus.byidx(1)
        end),
        awful.button({ }, 5, function ()
            awful.client.focus.byidx(-1)
        end))

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])

    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- {{{ Wibar
    -- Create a textclock widget
    local mytextclock = wibox.widget.textclock()

    --calendar-widget
    local mycalendar = awful.widget.calendar_popup.month({
        position = "tc",
        screen = s,
        start_sunday = false,
    })
    mytextclock:connect_signal("button::press", function(_, _, _, button)
        if button == 1 then
            mycalendar:toggle()
        end
    end)

    local separator = wibox.widget.textbox("  ")

    panel:setup {
        layout = wibox.layout.stack,
        expand = "none",
        {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                separator,
                mylauncher,
                separator,
                s.mytaglist,
                separator,
                s.mypromptbox,
            },
            -- { layout = wibox.layout.fixed.horizontal, },
            nil,
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                wibox.widget.systray(),
                separator,
            },
        },
        {
            mytextclock,
            valign = "center",
            halign = "center",
            layout = wibox.container.place,
        },
    }
end

return M
