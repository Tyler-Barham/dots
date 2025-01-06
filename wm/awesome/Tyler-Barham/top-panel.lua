
local M = {}

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local keymaps = require("Tyler-Barham.keymaps")

local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
local battery_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")

local panel_height = 32
local widget_size = panel_height - 8
local angle_length = 15
local container_bg = "#111111"

local systray = wibox.widget.systray()

M.create = function(s)
    systray:set_base_size(widget_size)
    beautiful.bg_systray = container_bg
    beautiful.systray_icon_spacing = 2

    local panel = awful.wibar({
        screen = s,
        position = "top",
        height = panel_height,
        width = s.geometry.width,
        opacity = 1,
        bg = gears.color.transparent
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
    local mytextclock = wibox.widget.textclock("<span font='Grape Nuts Bold Italic 12'>%a %d %b - %T</span>", 1)
    mytextclock.forced_width = 150

    local mycalendar = calendar_widget({
        start_sunday = true,
    })
    mytextclock:connect_signal("button::press", function(_, _, _, button)
        if button == 1 then
            mycalendar:toggle()
        end
    end)

    local separator = wibox.widget.textbox("  ")
    local separator_end = wibox.widget.textbox("        ")

    panel:setup {
        layout = wibox.layout.stack,
        expand = "none",
        {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                widget = wibox.container.background,
                bg = container_bg,
                shape = function (cr, w, h)
                    gears.shape.transform(gears.shape.rectangular_tag) : rotate_at(w/2, h/2, math.pi) (cr, w, h, angle_length)
                end,
                {
                    layout = wibox.layout.fixed.horizontal,
                    mylauncher,
                    separator,
                    s.mytaglist,
                    separator_end,
                }
            },
            nil,
            { -- Right widgets
                widget = wibox.container.background,
                bg = container_bg,
                shape = function (cr, w, h)
                    gears.shape.rectangular_tag(cr, w, h, angle_length)
                end,
                {
                    layout = wibox.layout.fixed.horizontal,
                    separator_end,
                    volume_widget{
                        widget_type = 'arc',
                        size = widget_size,
                    },
                    separator,
                    battery_widget({
                        size = widget_size,
                        font = 'Play ' .. panel_height/3,
                        show_current_level = true,
                        show_notification_mode = 'off',
                    }),
                    separator,
                    {
                        widget = wibox.container.place,
                        valign = "center",
                        systray
                    },
                    separator,
                    separator,
                }
            },
        },
        {
            valign = "center",
            halign = "center",
            layout = wibox.container.place,
            {
                widget = wibox.container.background,
                bg = container_bg,
                shape = gears.shape.octogon,
                {
                    widget = wibox.container.margin,
                    left = 25,
                    right = 20,
                    top = 4,
                    bottom = 4,
                    mytextclock
                },
            },
        },
    }
end

return M
